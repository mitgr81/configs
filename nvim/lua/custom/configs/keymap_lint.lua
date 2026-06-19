-- keymap_lint.lua
--
-- Flags keymaps that duplicate a Neovim 0.11+ built-in default action under a
-- different key (e.g. <leader>ca bound to vim.lsp.buf.code_action when the
-- built-in default is `gra`). The goal is to retrain muscle memory onto the
-- defaults rather than maintaining redundant custom maps.
--
-- Matching is by *function reference*: a map whose `callback` IS one of the
-- default action functions. This cleanly catches direct maps like
--   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
-- but NOT wrapped maps like  function() Snacks.picker.lsp_references() end
-- (those can't be compared by reference). In practice the wrapped picker maps
-- already use the default keys, so the redundant ones are exactly the direct
-- vim.lsp.buf.* maps — which this catches.
--
-- Many of these maps are buffer-local (created in on_attach on LspAttach), so
-- the scan runs on LspAttach, not at startup.

local M = {}

-- default action function -> { key = <canonical default lhs>, name = <label> }
local defaults = {
  [vim.lsp.buf.rename] = { key = 'grn', name = 'rename' },
  [vim.lsp.buf.code_action] = { key = 'gra', name = 'code_action' },
  [vim.lsp.buf.references] = { key = 'grr', name = 'references' },
  [vim.lsp.buf.implementation] = { key = 'gri', name = 'implementation' },
  [vim.lsp.buf.hover] = { key = 'K', name = 'hover' },
  [vim.lsp.buf.document_symbol] = { key = 'gO', name = 'document_symbol' },
}

-- Findings already reported this session, keyed by "<mode> <lhs> <name>".
local reported = {}

-- Make a normalized lhs readable (the mapleader is stored as a literal space).
local function pretty_lhs(lhs)
  local leader = vim.g.mapleader == ' ' and ' ' or vim.g.mapleader
  if leader and lhs:sub(1, #leader) == leader then
    return '<leader>' .. lhs:sub(#leader + 1)
  end
  return lhs
end

-- Best-effort: find file:line where a keymap (by its readable lhs literal) is
-- defined, by grepping the config dir. Gives quickfix items a real location so
-- they render in Trouble and jump to the offending vim.keymap.set call.
-- Resolve symlinks: ~/.config/nvim is commonly a symlink to a dotfiles repo,
-- and `grep -r` won't descend into a symlinked root.
local config_dir = vim.uv.fs_realpath(vim.fn.stdpath 'config') or vim.fn.stdpath 'config'
local function locate(pretty)
  if vim.fn.executable 'grep' == 0 then
    return nil
  end
  local lines = vim.fn.systemlist { 'grep', '-rn', '-F', '--include=*.lua', pretty, config_dir }
  for _, line in ipairs(lines) do
    -- Skip this linter's own file (its comments mention example lhs strings).
    if not line:match 'keymap_lint%.lua' then
      local file, lnum = line:match '^(.-):(%d+):'
      if file then
        return file, tonumber(lnum)
      end
    end
  end
end

-- Scan one list of maps (from nvim_get_keymap / nvim_buf_get_keymap).
local function scan(maps, mode, out)
  for _, m in ipairs(maps) do
    local def = m.callback and defaults[m.callback]
    if def and m.lhs ~= def.key then
      local id = mode .. ' ' .. m.lhs .. ' ' .. def.name
      if not reported[id] then
        reported[id] = true
        local pretty = pretty_lhs(m.lhs)
        local file, lnum = locate(pretty)
        out[#out + 1] = {
          filename = file,
          lnum = lnum or 1,
          text = string.format('[%s] %s -> %s — built-in default is `%s`', mode, pretty, def.name, def.key),
        }
      end
    end
  end
end

-- Run the lint. Returns the list of *new* findings this call.
function M.run(bufnr)
  local out = {}
  for _, mode in ipairs { 'n', 'i', 'v', 'x' } do
    scan(vim.api.nvim_get_keymap(mode), mode, out)
    if bufnr then
      scan(vim.api.nvim_buf_get_keymap(bufnr, mode), mode, out)
    end
  end
  if #out > 0 then
    -- Append to the quickfix list so prior findings aren't clobbered.
    vim.fn.setqflist({}, 'a', { title = 'Keymap lint: redundant vs built-in defaults', items = out })
    vim.notify(
      string.format('%d keymap(s) duplicate built-in defaults — :KeymapLint or <leader>xQ to view', #out),
      vim.log.levels.WARN,
      { title = 'keymap-lint' }
    )
  end
  return out
end

-- Open the findings in the quickfix window (Trouble if available, else copen).
local function open_list()
  if pcall(require, 'trouble') then
    vim.cmd 'Trouble qflist open'
  else
    vim.cmd 'copen'
  end
end

-- :KeymapLint — re-scan the current buffer and open the list.
vim.api.nvim_create_user_command('KeymapLint', function()
  reported = {} -- allow a fresh full report on demand
  vim.fn.setqflist({}, 'r', { title = 'Keymap lint: redundant vs built-in defaults', items = {} })
  local found = M.run(vim.api.nvim_get_current_buf())
  if #found == 0 then
    vim.notify('No keymaps duplicate built-in defaults 🎉', vim.log.levels.INFO, { title = 'keymap-lint' })
  else
    open_list()
  end
end, { desc = 'Lint keymaps that duplicate built-in defaults' })

-- Auto-run on LspAttach (catches buffer-local on_attach maps). Deferred so all
-- maps for the buffer are in place first.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('keymap-lint', { clear = true }),
  callback = function(ev)
    vim.defer_fn(function()
      if vim.api.nvim_buf_is_valid(ev.buf) then
        M.run(ev.buf)
      end
    end, 200)
  end,
})

return M

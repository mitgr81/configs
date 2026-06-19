-- Neovim config (migrated from lazy.nvim to vim.pack on 0.12)
--
-- Plugins live in `plugin/*.lua`, auto-sourced alphabetically AFTER this file.
-- Each does `vim.pack.add{...}` then its own setup. See `:help vim.pack`.

-- Enable the bytecode loader cache (faster startup). Must be early.
vim.loader.enable()

-- Set <space> as the leader key.
--  Must happen before plugins are loaded (otherwise wrong leader is used).
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- [[ Startup profiler ]] (replacement for `:Lazy profile`)
-- Launch with `PROF=1 nvim` to capture a snacks startup profile. snacks is
-- added later by plugin/snacks.lua, so we put its install dir on the
-- runtimepath manually here to load the profiler before plugins run.
if vim.env.PROF then
  local snacks = vim.fn.stdpath 'data' .. '/site/pack/core/opt/snacks.nvim'
  vim.opt.rtp:append(snacks)

  -- Work around an upstream snacks profiler bug: some Neovim builtins (e.g.
  -- `vim.F`) report a chunk source of "@vim/F" with no `.lua` extension, so
  -- profiler/loc.ts_locs() tries to readfile a path that doesn't exist and
  -- throws E484. Guard it: append `.lua` when the bare path is missing, and
  -- return nothing if the file still can't be found. Harmless once fixed
  -- upstream. https://github.com/folke/snacks.nvim (profiler/loc.lua)
  local ok, loc = pcall(require, 'snacks.profiler.loc')
  if ok and loc.ts_locs then
    local orig = loc.ts_locs
    loc.ts_locs = function(file)
      if vim.uv.fs_stat(file) == nil and vim.uv.fs_stat(file .. '.lua') then
        file = file .. '.lua'
      end
      if vim.uv.fs_stat(file) == nil then
        return {}
      end
      return orig(file)
    end
  end

  require('snacks.profiler').startup {
    startup = { event = 'VimEnter' }, -- stop profiling on this event
  }
end

-- [[ Plugin build/update hooks ]]
-- Must be registered BEFORE any vim.pack.add (which runs in plugin/*.lua).
-- Rebuild treesitter parsers whenever nvim-treesitter is updated.
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
    end
  end,
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- NOTE: `require 'custom.configs'` is intentionally NOT called here.
-- custom/configs/settings.lua requires plugins (cmp, ibl, lualine, noice, ...)
-- that are only added by the plugin/*.lua files, which Neovim sources AFTER
-- init.lua. It is loaded last from plugin/zz-custom-configs.lua instead.

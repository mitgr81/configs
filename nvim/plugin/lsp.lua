-- LSP — native Neovim 0.11+ config (vim.lsp.config / vim.lsp.enable).
-- nvim-lspconfig ships the per-server `lsp/<name>.lua` defaults that
-- vim.lsp.enable activates; mason installs the server binaries.
vim.pack.add {
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  { src = 'https://github.com/j-hui/fidget.nvim', version = 'legacy' },
}

require('fidget').setup {}
-- mason.setup() is cheap (~10ms) AND prepends mason's bin/ to PATH, which
-- vim.lsp.enable relies on to find server binaries — so it must run eagerly.
-- (The expensive registry/ensure_installed work is deferred below.)
require('mason').setup()

-- This runs when an LSP attaches to a buffer. Keymaps preserved verbatim.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]efactor: re[n]ame')
  nmap('<leader>ra', vim.lsp.buf.code_action, '[R]efactor: Code [A]ction')
  nmap('<leader>ca', vim.lsp.buf.code_action, 'Refactor: [C]ode [A]ction')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Shared defaults for every server. cmp advertises extra completion caps.
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = on_attach,
})

-- Per-server overrides (settings / filetypes), matching the old config.
vim.lsp.config('ruff', {
  init_options = {
    settings = {
      run = 'onSave',
      args = { '--line-length=120' },
    },
  },
})
vim.lsp.config('pyrefly', { filetypes = { 'python' } })
vim.lsp.config('ty', { filetypes = { 'python' } })
vim.lsp.config('eslint', {
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx' },
})
vim.lsp.config('vtsls', {
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
})
vim.lsp.config('html', { filetypes = { 'html', 'twig', 'hbs' } })
vim.lsp.config('jinja_lsp', {
  filetypes = { 'jinja2', 'jinja', 'xml.jinja', 'html.jinja', 'json.jinja', 'plain.jinja' },
})
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

-- Servers to install (mason) and enable (native LSP).
local servers = {
  'gopls',
  'bashls',
  'dockerls',
  'ruff',
  'pyrefly',
  'ty',
  'rust_analyzer',
  'eslint',
  'vtsls',
  'marksman',
  'html',
  'lua_ls',
  'taplo',
  'yamlls',
  'cucumber_language_server',
  'jinja_lsp',
}

-- Enable servers now (cheap — just registers configs; already-installed
-- servers attach immediately).
vim.lsp.enable(servers)

-- Defer mason-lspconfig: its setup loads mason-registry / mason-core.async /
-- the GitHub source (~35ms) just to check ensure_installed. None of that is
-- needed for already-installed servers to attach (mason.setup above already
-- put their binaries on PATH); missing servers just install a moment later.
vim.schedule(function()
  require('mason-lspconfig').setup {
    ensure_installed = servers,
    automatic_installation = false,
    -- We enable servers explicitly above, so don't let mason-lspconfig also do it.
    automatic_enable = false,
  }
end)

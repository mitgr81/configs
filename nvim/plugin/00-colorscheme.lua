-- Colorscheme — loaded first to avoid a flash of the default theme.
vim.pack.add {
  'https://github.com/folke/tokyonight.nvim',
}

vim.o.background = 'dark'
vim.cmd.colorscheme 'tokyonight-night'

vim.pack.add {
  'https://github.com/nvim-lualine/lualine.nvim',
}

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'tokyonight',
    section_separators = { left = '', right = '' },
  },
}

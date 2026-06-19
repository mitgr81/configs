vim.pack.add {
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/akinsho/bufferline.nvim',
}

vim.opt.termguicolors = true
require('bufferline').setup {
  options = {
    separator_style = 'slant',
  },
}

-- Small editing/UI plugins grouped together.
vim.pack.add {
  'https://github.com/echasnovski/mini.icons',
  'https://github.com/numToStr/Comment.nvim',
  'https://github.com/NvChad/nvim-colorizer.lua',
  'https://github.com/HiPhish/rainbow-delimiters.nvim',
  'https://github.com/lukas-reineke/indent-blankline.nvim',
  'https://github.com/tpope/vim-sleuth',
}

require('mini.icons').setup()
require('Comment').setup()
require('colorizer').setup()
require('ibl').setup {}
-- rainbow-delimiters and vim-sleuth need no setup call.

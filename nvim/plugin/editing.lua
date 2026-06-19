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

-- colorizer is ~20ms to load + set up; defer it a frame so it lands just after
-- the first paint instead of on the startup critical path.
vim.schedule(function()
  require('colorizer').setup()
end)

-- ibl is configured in custom/configs/settings.lua (rainbow highlights + hooks).
-- rainbow-delimiters and vim-sleuth need no setup call.

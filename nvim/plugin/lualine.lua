vim.pack.add {
  'https://github.com/nvim-lualine/lualine.nvim',
}

-- lualine is configured in custom/configs/settings.lua (loaded last, after
-- noice, which its statusline section depends on). Setting it up here too was
-- redundant — that later setup replaced this one entirely.

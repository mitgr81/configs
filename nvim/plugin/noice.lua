-- noice + deps, plus dressing (workaround for noice issue #938).
vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/rcarriga/nvim-notify',
  'https://github.com/folke/noice.nvim',
  'https://github.com/stevearc/dressing.nvim',
}

require('noice').setup {
  presets = { lsp_doc_border = true },
}

require('dressing').setup {}

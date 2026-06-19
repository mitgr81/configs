vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/folke/todo-comments.nvim',
}

require('todo-comments').setup {
  highlight = {
    pattern = { [[.*<(KEYWORDS)\s*:]], [[.*<(KEYWORDS)\s*\(.*\)\s*:]] },
    keyword = 'bg',
  },
  search = {
    pattern = [[\b(KEYWORDS)(\s*\(.*\)\s*)?:]],
  },
}

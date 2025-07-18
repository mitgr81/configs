return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    highlight = {
      pattern = { [[.*<(KEYWORDS)\s*:]], [[.*<(KEYWORDS)\s*\(.*\)\s*:]] },
      keyword = "bg",
    },
    search = {
      pattern = [[\b(KEYWORDS)(\s*\(.*\)\s*)?:]],
    },
  }
}

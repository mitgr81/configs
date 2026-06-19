-- noice + deps, plus dressing (workaround for noice issue #938).
vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/rcarriga/nvim-notify',
  'https://github.com/folke/noice.nvim',
  'https://github.com/stevearc/dressing.nvim',
}

require('noice').setup {
  lsp = {
    -- Override markdown rendering so cmp and other plugins use Treesitter.
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  presets = {
    -- bottom_search and command_palette are intentionally OFF so the cmdline
    -- and search both use the default centered popup (row 50%, col 50%).
    -- bottom_search would move search to the bottom; command_palette pins the
    -- cmdline to row 3 (top).
    bottom_search = false, -- center search instead of a bottom cmdline
    command_palette = false, -- keep the cmdline centered, not pinned to the top
    long_message_to_split = true, -- long messages sent to a split
    inc_rename = false, -- input dialog for inc-rename.nvim
    lsp_doc_border = true, -- border on hover docs and signature help
  },
}

require('dressing').setup {}

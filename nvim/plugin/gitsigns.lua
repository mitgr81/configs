vim.pack.add {
  'https://github.com/lewis6991/gitsigns.nvim',
}

require('gitsigns').setup {
  signs = {},
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
    vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { buffer = bufnr, desc = 'Stage git hunk' })
    vim.keymap.set('v', '<leader>hs', function()
      gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, { desc = 'Stage git hunk' })

    -- don't override the built-in and fugitive keymaps
    vim.keymap.set({ 'n', 'v' }, ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
    vim.keymap.set({ 'n', 'v' }, '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
  end,
}

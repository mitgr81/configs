vim.pack.add {
  'https://github.com/preservim/vimux',
  'https://github.com/vim-test/vim-test',
}

-- Only TestNearest is bound; the other vim-test maps (<leader>T/a/l/g)
-- collided with the git prefix and treesitter param-swap, so they're dropped.
vim.keymap.set('n', '<leader>t', ':TestNearest<CR>', { desc = 'Test nearest' })

if vim.fn.exists '$TMUX' ~= 0 then
  vim.cmd "let test#strategy = 'vimux'"
end

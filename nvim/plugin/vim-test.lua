vim.pack.add {
  'https://github.com/preservim/vimux',
  'https://github.com/vim-test/vim-test',
}

vim.keymap.set('n', '<leader>t', ':TestNearest<CR>', {})
vim.keymap.set('n', '<leader>T', ':TestFile<CR>', {})
vim.keymap.set('n', '<leader>a', ':TestSuite<CR>', {})
vim.keymap.set('n', '<leader>l', ':TestLast<CR>', {})
vim.keymap.set('n', '<leader>g', ':TestVisit<CR>', {})

if vim.fn.exists '$TMUX' ~= 0 then
  vim.cmd "let test#strategy = 'vimux'"
end

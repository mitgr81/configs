-- Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
vim.keymap.set("i", "jj", "<ESC>")

-- Bind Escape to leave "terminal" mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

--vim.keymap.set("n", "<leader>/", ":Neotree toggle current reveal_force_cwd")
-- vim.keymap.set("n", "<leader>e", ":Neotree toggle<cr>")
-- vim.keymap.set("n", "<leader>E", ":Neotree reveal<cr>")
vim.keymap.set("n", "<leader>e", ":Ex<cr>", { desc = "Open file [e]xplorer" })
vim.keymap.set("n", "<leader>E", ":Ex<cr>", { desc = "Open file [E]xplorer" })

--vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
--
-- Make CTRL-E and CTRL-A jump to end and beginning of line
vim.keymap.set('n', '<C-a>', '<ESC>^')
vim.keymap.set('i', '<C-a>', '<ESC>I')
vim.keymap.set('n', '<C-e>', '<ESC>$')
vim.keymap.set('i', '<C-e>', '<ESC>A')

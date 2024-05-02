-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = 'Search [F]iles in [G]it' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fp', ':Telescope project<cr>', { desc = '[F]ind [P]roject' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

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

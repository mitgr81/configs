return {
    "vim-test/vim-test",
    dependencies = {
        "preservim/vimux"
    },
    config = function()
        -- vim-test configs
        vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", {})
        vim.keymap.set("n", "<leader>T", ":TestFile<CR>", {})
        vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", {})
        vim.keymap.set("n", "<leader>l", ":TestLast<CR>", {})
        vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", {})

        if vim.fn.exists('$TMUX') ~= 0 then
            vim.cmd("let test#strategy = 'vimux'")
        end
    end,
}

return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
        require("refactoring").setup()
        -- (Only pulled this out to a local so it fits on one line :) )
        local prompt_me = function() require('refactoring').select_refactor() end
        vim.keymap.set({ "n", "x" }, "<leader>rr", prompt_me, { desc = "[R]efacto[r] Prompt" })
        -- Note that not all refactors support both normal and visual mode
    end,
}

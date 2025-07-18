return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
        -- add any opts here
    },
    build = "make",
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua",      -- for providers='copilot'
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        -- {
        --     -- Make sure to set this up properly if you have lazy=true
        --     'MeanderingProgrammer/render-markdown.nvim',
        --     opts = {
        --         file_types = { "markdown", "Avante" },
        --     },
        --     ft = { "markdown", "Avante" },
        -- },
    },

    config = function()
        require("avante").setup({
            -- Provider configuration
            provider = "copilot",
            auto_suggestions_provider = "copilot",
            providers = {
                copilot = {
                    -- model = "claude-sonnet-4",
                    -- model = "claude-4-0-sonnet",
                    -- model = "claude-3-5-sonnet-20241022",
                    -- model = "claude-4-0-sonnet",
                },
            },

            -- Mappings configuration
            mappings = {
                --- @class AvanteConflictMappings
                diff = {
                    ours = "co",
                    theirs = "ct",
                    all_theirs = "ca",
                    both = "cb",
                    cursor = "cc",
                    next = "]x",
                    prev = "[x",
                },
                suggestion = {
                    accept = "<M-l>",
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
                jump = {
                    next = "]]",
                    prev = "[[",
                },
                submit = {
                    normal = "<CR>",
                    insert = "<C-s>",
                },
                sidebar = {
                    apply_all = "A",
                    apply_cursor = "a",
                    switch_windows = "<Tab>",
                    reverse_switch_windows = "<S-Tab>",
                },
            },

            -- Hints configuration
            hints = { enabled = true },

            -- Windows configuration
            windows = {
                ---@type "right" | "left" | "top" | "bottom"
                position = "right",   -- the position of the sidebar
                wrap = true,          -- similar to vim.o.wrap
                width = 30,           -- default % based on available width
                sidebar_header = {
                    align = "center", -- left, center, right for title
                    rounded = true,
                },
                input = {
                    prefix = "> ",
                },
                edit = {
                    border = "rounded",
                },
                ask = {
                    floating = false,    -- Open the 'AvanteAsk' prompt in a floating window
                    start_insert = true, -- Start insert mode when opening the ask window
                    border = "rounded",
                },
            },

            -- Highlights configuration
            highlights = {
                ---@type AvanteConflictHighlights
                diff = {
                    current = "DiffText",
                    incoming = "DiffAdd",
                },
            },

            --- @class AvanteConflictUserConfig
            diff = {
                autojump = true,
                ---@type string | fun(): string
                list_opener = "copen",
            },
        })
    end,
}

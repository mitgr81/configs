return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup {
            auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            session_lens = {
                buftypes_to_ignore = {},
                load_on_setup = true,
                previewer = false,
            },
        }
    end,
}

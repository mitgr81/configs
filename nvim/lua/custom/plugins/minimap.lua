return {
    'gorbit99/codewindow.nvim',
    config = function()
        local codewindow = require('codewindow')
        codewindow.setup({ window_border = 'single', auto_enable = false, screen_bounds = "background" })
        codewindow.apply_default_keybinds()
        vim.api.nvim_set_hl(0, 'CodewindowBorder', { fg = '#2A2E40' })
    end,
}

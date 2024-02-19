-- Helper function for transparency formatting
local target_transparency = 255 * (vim.g.transparency or 0.9)
local alpha = function()
	return string.format("%x", math.floor(target_transparency))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.95

vim.g.neovide_cursor_vfx_mode = "pixiedust"

vim.keymap.set("n", "<D-s>", ":w<CR>")      -- Save
vim.keymap.set("i", "<D-s>", ":w<CR>")      -- Save
vim.keymap.set("v", "<D-c>", '"+y')         -- Copy
vim.keymap.set("n", "<D-v>", '"+P')         -- Paste normal mode
vim.keymap.set("v", "<D-v>", '"+P')         -- Paste visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+")      -- Paste command mode
vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

require 'custom.configs.keymaps'
require 'custom.configs.settings'
require 'custom.configs.commands'
require 'custom.configs.keymap_lint'

if vim.g.neovide then
	require 'custom.configs.neovide'
end

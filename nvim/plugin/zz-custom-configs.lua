-- Loaded last (zz- prefix sorts after all other plugin/ files) so that the
-- plugins required inside custom/configs/settings.lua (ibl, lualine, noice,
-- luasnip, ...) have already been added by their respective plugin/*.lua
-- files. settings.lua configures a few of these (e.g. lualine, ibl) here
-- because they depend on plugins (like noice) loaded earlier in plugin/.
require 'custom.configs'

-- Loaded last (zz- prefix sorts after all other plugin/ files) so that the
-- plugins required inside custom/configs/settings.lua (cmp, lspkind, ibl,
-- colorizer, lualine, noice, luasnip) have already been added by their
-- respective plugin/*.lua files. settings.lua deliberately re-runs several
-- plugin setups to override defaults — matching the pre-migration behavior.
require 'custom.configs'

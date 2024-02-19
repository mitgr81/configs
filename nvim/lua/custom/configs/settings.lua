require("colorizer").setup()
-- See https://github.com/lukas-reineke/indent-blankline.nvim for more
local highlight = {
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
	"RainbowRed",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#1d4656" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#426183" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#364635" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#c49b5a" })
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#413959" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
end)

require("ibl").setup({
	indent = { highlight = highlight, char = '┊' },
	exclude = { filetypes = { "dashboard" } },
})

vim.g["test#python#runner"] = 'pytest'
-- vim.g["test#python#pytest#executable"] = 'poetry run pytest -m "not integration" --disable-warnings '
-- END vim-test configs
require('dashboard').setup({
	theme = 'hyper',
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
			{
				icon = ' ',
				icon_hl = '@variable',
				desc = 'Files',
				group = 'Label',
				action = 'Telescope find_files',
				key = 'f',
			},
			{
				desc = ' Projects',
				group = 'Label',
				action = 'Telescope project',
				key = 'p',
			},
		},
	},
})
local lspkind = require('lspkind')
require("cmp").setup({
	formatting = {
		format = lspkind.cmp_format(),
	},
})
-- cmp setup from nvchad
--
-- local cmp = require "cmp"
--
-- dofile(vim.g.base46_cache .. "cmp")
--
-- local cmp_ui = require("core.utils").load_config().ui.cmp
-- local cmp_style = cmp_ui.style
--
-- local field_arrangement = {
--     atom = { "kind", "abbr", "menu" },
--     atom_colored = { "kind", "abbr", "menu" },
-- }
--
-- local formatting_style = {
--     -- default fields order i.e completion word + item.kind + item.kind icons
--     fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },
--
--     format = function(_, item)
--         local icons = require "nvchad.icons.lspkind"
--         local icon = (cmp_ui.icons and icons[item.kind]) or ""
--
--         if cmp_style == "atom" or cmp_style == "atom_colored" then
--             icon = " " .. icon .. " "
--             item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
--             item.kind = icon
--         else
--             icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
--             item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
--         end
--
--         return item
--     end,
-- }
--
-- local function border(hl_name)
--     return {
--         { "╭", hl_name },
--         { "─", hl_name },
--         { "╮", hl_name },
--         { "│", hl_name },
--         { "╯", hl_name },
--         { "─", hl_name },
--         { "╰", hl_name },
--         { "│", hl_name },
--     }
-- end
--
-- local options = {
--     completion = {
--         completeopt = "menu,menuone",
--     },
--
--     window = {
--         completion = {
--             side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
--             winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
--             scrollbar = false,
--         },
--         documentation = {
--             border = border "CmpDocBorder",
--             winhighlight = "Normal:CmpDoc",
--         },
--     },
--     snippet = {
--         expand = function(args)
--             require("luasnip").lsp_expand(args.body)
--         end,
--     },
--
--     formatting = formatting_style,
--
--     mapping = {
--         ["<C-p>"] = cmp.mapping.select_prev_item(),
--         ["<C-n>"] = cmp.mapping.select_next_item(),
--         ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<C-e>"] = cmp.mapping.close(),
--         ["<CR>"] = cmp.mapping.confirm {
--             behavior = cmp.ConfirmBehavior.Insert,
--             select = true,
--         },
--         ["<Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_next_item()
--             elseif require("luasnip").expand_or_jumpable() then
--                 vim.fn.feedkeys(
--                 vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
--             else
--                 fallback()
--             end
--         end, {
--             "i",
--             "s",
--         }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_prev_item()
--             elseif require("luasnip").jumpable(-1) then
--                 vim.fn.feedkeys(
--                 vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
--             else
--                 fallback()
--             end
--         end, {
--             "i",
--             "s",
--         }),
--     },
--     sources = {
--         { name = "nvim_lsp" },
--         { name = "luasnip" },
--         { name = "buffer" },
--         { name = "nvim_lua" },
--         { name = "path" },
--     },
-- }
--
-- if cmp_style ~= "atom" and cmp_style ~= "atom_colored" then
--     options.window.completion.border = border "CmpBorder"
-- end
--
-- return options

--
--
--
--
--
-- require("tokyonight").setup {
--   transparent = true,
--   styles = {
--     sidebars = "transparent",
--     floats = "transparent",
--   }
-- }
-- vim.cmd [[highlight NonText ctermbg=none]]
-- vim.cmd [[highlight NonText guibg=none]]
-- vim.cmd [[highlight Normal ctermbg=none]]
-- vim.cmd [[highlight Normal guibg=none]]

-- from https://neovim.io/doc/user/lsp.html#lsp-faq
-- END cmp setup from nvchad
--
-- vim.defer_fn(function()
-- 	require("catppuccin").setup({
-- 		flavour = "macchiato",
-- 		-- compile_path = vim.fn.stdpath "cache" .. "/catppuccin"
-- 	})
-- end, 10)

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local p = require("luasnip.extras").partial
ls.add_snippets("markdown", {
	s("wle", {
		p(os.date, "# %Y-%m-%d (%A):"),
		t({ "", "" }),
		t({ "* In: " }),
		i(1),
		t({ "", "* Out:", "" }),
		t({ "* Lunch:", "" }),
		t({ "* Timesheet Hours:", "" }),
		t({ "* Morning:", "" }),
		t({ "    * ", }),
		i(2),
		t({ "", "* Afternoon:", "" }),
		t({ "    * ", }),
		i(3),
		t({ "", "" }),
	}),
})

local misc_augroup = vim.api.nvim_create_augroup("misc", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	-- Adapted from: vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })]]
	desc = "Run LSP formatter on Write",
	group = misc_augroup,
	pattern = "*",
	command = 'lua vim.lsp.buf.format({async = false})',
})

vim.api.nvim_create_autocmd("BufWritePre", {
	buffer = buffer,
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "toml" then
			return
		end
		vim.lsp.buf.code_action({
			context = { only = { "source.organizeImports" } },
			apply = true,
		})
		vim.wait(100)
	end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
	desc = 'Open file at the last position it was edited earlier',
	group = misc_augroup,
	pattern = '*',
	command = 'silent! normal! g`"zv'
})
vim.opt.hlsearch = true
vim.opt.colorcolumn = "120"
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.fixeol = false
vim.opt.eol = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.list = true
vim.opt.listchars = "tab:>.,trail:~,extends:>,precedes:<"
vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "number"
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

-- Spelling see https://johncodes.com/posts/2023/02-25-nvim-spell/ and https://neovim.io/doc/user/spell.html
-- ]s will go to the next misspelled word.
-- [s will go to the previous misspelled word.
-- When the cursor is under a word that is misspelled, z= will open the list of suggestions. Typically, the first suggestion is almost always right. Hit 1 and <enter> in the prompt to indicate you want to take the first suggestion. And the word has been fixed!
-- With your cursor under the correctly spelled word that is underlined as misspelled, use the zg mapping to mark the word as a “good” word.
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

require("lualine").setup({
	sections = {
		lualine_c = {
			{
				'filename',
				path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path, 3 = abs path with ~ for home
			}
		}
	}
})

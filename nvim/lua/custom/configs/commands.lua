vim.api.nvim_create_user_command("Cppath", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- vim.pack convenience wrappers (replacements for `:Lazy update` / `:Lazy`).
--
-- :PackUpdate            update all plugins (opens the review tab; :w confirms)
-- :PackUpdate snacks.nvim trouble.nvim   update only the named plugins
-- :PackUpdate!           update all, skipping the confirmation buffer (force)
vim.api.nvim_create_user_command("PackUpdate", function(opts)
	local names = #opts.fargs > 0 and opts.fargs or nil
	vim.pack.update(names, { force = opts.bang })
end, {
	nargs = "*",
	bang = true,
	desc = "Update vim.pack plugins (all, or named; ! to skip confirmation)",
	complete = function(arglead)
		return vim.iter(vim.pack.get())
			:map(function(p)
				return p.spec.name
			end)
			:filter(function(name)
				return name:find(arglead, 1, true) == 1
			end)
			:totable()
	end,
})

-- :PackStatus — show installed plugins/state without fetching (like `:Lazy`).
vim.api.nvim_create_user_command("PackStatus", function()
	vim.pack.update(nil, { offline = true })
end, { desc = "Show installed vim.pack plugins/state without fetching" })

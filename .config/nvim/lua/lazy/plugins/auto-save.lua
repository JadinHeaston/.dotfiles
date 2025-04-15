return {
	{
		"okuuva/auto-save.nvim",
		version = '^1.0.0',                 -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
		cmd = "ASToggle",                   -- optional for lazy loading on command
		event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
		enabled = false, -- Disabled by default.
		opts = {
			-- debounce_delay = 500, -- ms waited before saving. (defaults to 1000ms)
		},
		keys = {
			{
				"<leader>tas",
				"<cmd>ASToggle<CR>",
				desc = "[T]oggle [auto]-[s]ave",
			},
		}
	},
}

-- There is a bug where the plugin defaults to being enabled regardless of what is done.
-- This is fine when event {} is removed, and `lazy = true` but requires toggling twice to enable it.

return {
	"okuuva/auto-save.nvim",
	version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
	cmd = "ASToggle", -- optional for lazy loading on command
	lazy = true,
	-- event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	opts = {
		-- debounce_delay = 500, -- ms waited before saving. (defaults to 1000ms)
		execution_message = {
			message = function()
				local filename = vim.fn.expand("%") --Likely the saved
				return ("AutoSaved " .. filename .. " at " .. vim.fn.strftime("%I:%M:%S %p"))
			end,
			dim = 0.18,
			cleaning_interval = 3000, -- ms
		},
	},
	keys = {
		{
			"<leader>tas",
			"<cmd>ASToggle<CR>",
			desc = "[T]oggle [auto]-[s]ave",
		},
	},
	config = function(_, opts)
		require("auto-save").setup(opts)

		-- Force toggle off once it's loaded
		vim.cmd("ASToggle")
	end,
}

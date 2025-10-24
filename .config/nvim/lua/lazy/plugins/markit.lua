return {
	"2kabhishek/markit.nvim",
	event = { "BufReadPre", "BufNewFile" },
	lazy = true,
	dependencies = {
		{
			"2KAbhishek/pickme.nvim",
			cmd = "PickMe",
			event = "VeryLazy",
			dependencies = {
				-- Include at least one of these pickers:
				-- "folke/snacks.nvim", -- For snacks.picker
				"nvim-telescope/telescope.nvim", -- For telescope
				-- 'ibhagwan/fzf-lua', -- For fzf-lua
			},
			opts = {
				picker_provider = "telescope", -- Default provider
			},
		},
		"nvim-lua/plenary.nvim",
	},
	opts = {
		enable_bookmarks = false,
	}, -- Add your configuration here, required if you are not calling markit.setup manually elsewhere
}

return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL: `nvim-notify` is only needed, if you want to use the notification view. `mini` is the fallback
			-- "rcarriga/nvim-notify",
		},
	}
}

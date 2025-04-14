return {
	{
		"AckslD/nvim-neoclip.lua",
		-- need to lazy load, otherwise telescope sometimes deletes all history
		dependencies = {
			{ "nvim-telescope/telescope.nvim" }, -- Required, but not stated here because it breaks things.
		},
		config = function()
			require("neoclip").setup()
			require("telescope").load_extension("neoclip")
		end,
	}
}

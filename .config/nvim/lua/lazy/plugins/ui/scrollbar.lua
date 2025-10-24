return {
	"petertriho/nvim-scrollbar",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"kevinhwang91/nvim-hlslens",
	},
	config = function()
		require("scrollbar").setup()

		-- Optional: integrate with gitsigns
		require("scrollbar.handlers.gitsigns").setup()
		-- Optional: integrate with hlslens
		require("scrollbar.handlers.search").setup()
	end,
	event = { "BufEnter", "WinScrolled", "WinResized" },
}

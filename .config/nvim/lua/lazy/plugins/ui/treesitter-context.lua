return { -- Adds context lines (Sticky Scroll) at the top when browsing nested content.
	"nvim-treesitter/nvim-treesitter-context",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("treesitter-context").setup({
			-- Set the separator line (adds a line below the context window)
			separator = "─", -- or "▁", "━", "▄", "⎯", etc.
			multiline_threshold = 20,
			mode = "cursor", -- or 'topline'
		})
		-- Apply highlight to separator line
		vim.cmd([[
				hi TreesitterContextSeparator guifg=#000000
			]])

		-- Optional: If you want to override context line style (but still keep it similar to Normal)
		-- You can link it to Normal and tweak it a bit:
		vim.cmd([[
				hi! link TreesitterContext Normal
				hi! link TreesitterContextLineNumber LineNr
			]])

		-- Jumping to context (upwards)
		vim.keymap.set("n", "[c", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { silent = true, desc = "Jump to [C]ontext" })
	end,
}

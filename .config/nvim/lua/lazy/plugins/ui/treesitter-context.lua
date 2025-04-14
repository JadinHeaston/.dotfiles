return {
	{ -- Adds context lines (Sticky Scroll) at the top when browsing nested content.
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-context").setup()

			-- Jumping to context (upwards)
			vim.keymap.set("n", "[c", function()
				require("treesitter-context").go_to_context(vim.v.count1)
			end, { silent = true, desc = "Jump to [C]ontext" })
		end,
    },
 }

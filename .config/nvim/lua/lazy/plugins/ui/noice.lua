return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL: `nvim-notify` is only needed, if you want to use the notification view. `mini` is the fallback
		{
			"rcarriga/nvim-notify",
			lazy = true,
			event = "VeryLazy",
			opts = {
				render = "default",
				stage = "static",
				max_width = function()
					return math.floor(vim.o.columns * 0.25)
				end,
				minimum_width = 100,
				background_color = "#000000",
				fps = 5,
			},
			config = function(_, opts)
				local notify = require("notify")
				notify.setup(opts)

				-- Recalculate max_width on resize
				vim.api.nvim_create_autocmd("VimResized", {
					callback = function()
						notify.setup({
							max_width = math.floor(vim.o.columns * 0.25),
						})
					end,
				})
			end,
		},
	},
	opts = {
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
	},
}

return {
	-- Better Around/Inside textobjects
	--
	-- Examples:
	--  - va)  - [V]isually select [A]round [)]paren
	--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
	--  - ci'  - [C]hange [I]nside [']quote
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = { n_lines = 500 },
	},

	-- Add/delete/replace surroundings (brackets, quotes, etc.)
	--
	-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
	-- - sd'   - [S]urround [D]elete [']quotes
	-- - sr)'  - [S]urround [R]eplace [)] [']
	{
		"echasnovski/mini.surround",
		keys = {
			{ "sa", mode = { "n", "x" } },
			{ "sd", mode = "n" },
			{ "sr", mode = "n" },
		},
		opts = {},
	},

	-- Custom statusline
	{
		"echasnovski/mini.statusline",
		event = "VimEnter",
		config = function()
			local statusline = require("mini.statusline")

			-- Define the highlight group for macro recording (Red background, White text)
			vim.cmd([[
				highlight StatusLineRed guibg=#FF0000 guifg=#FFFFFF
			]])

			-- Override cursor location section to show LINE:COLUMN
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- Setup statusline
			statusline.setup({
				use_icons = vim.g.have_nerd_font,
				content = {
					active = function()
						-- Check if a macro is recording
						local check_macro_recording = function()
							if vim.fn.reg_recording() ~= "" then
								return " Recording @" .. vim.fn.reg_recording() .. " "
							else
								return ""
							end
						end

						-- Sections
						local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
						local git = statusline.section_git({ trunc_width = 40 })
						local diff = statusline.section_diff({ trunc_width = 75 })
						local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
						local filename = statusline.section_filename({ trunc_width = 140 })
						local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
						local location = statusline.section_location({ trunc_width = 200 })
						local search = statusline.section_searchcount({ trunc_width = 75 })
						local macro = check_macro_recording()
						if macro ~= "" then
							macro = "%#StatusLineRed#" .. macro .. "%*"
						end

						-- Combine sections
						return statusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
							"%<", -- truncate point
							{ hl = "MiniStatuslineFilename", strings = { filename } },
							"%=", -- right-align remainder
							{ hl = "MiniStatuslineFilename", strings = { macro } },
							{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
							{ hl = mode_hl, strings = { search, location } },
						})
					end,
				},
			})
		end,
	},
}

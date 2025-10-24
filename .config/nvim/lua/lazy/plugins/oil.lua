return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		CustomOilBar = function()
			local path = vim.fn.expand("%")
			path = path:gsub("oil://", "")

			return "  " .. vim.fn.fnamemodify(path, ":.")
		end

		local detail = true -- Sets default detail state.
		require("oil").setup({
			columns = { "icon", "permissions", "size", "mtime" },
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
				["<C-k>"] = false,
				["<C-j>"] = false,
				["<M-h>"] = "actions.select_split",
				["gd"] = {
					desc = "Toggle file detail view",
					callback = function()
						detail = not detail
						if detail then
							require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
						else
							require("oil").set_columns({ "icon" })
						end
					end,
				},
			},
			win_options = {
				winbar = "%{v:lua.CustomOilBar()}",
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					local folder_skip = { "dev-tools.locks", "dune.lock", "_build" }
					return vim.tbl_contains(folder_skip, name)
				end,
			},
		})

		-- Open parent directory in current window
		vim.keymap.set("n", "-", function()
			require("oil").open(nil, nil, function()
				require("oil").open_preview()
			end)
		end, { desc = "Open parent directory" })

		-- Open parent directory in floating window
		vim.keymap.set("n", "<space>-", function()
			require("oil").open_float(nil, nil, function()
				require("oil").open_preview()
			end)
		end, { desc = "Open parent directory (Oil - Floating)" })
	end,
	lazy = false,
}

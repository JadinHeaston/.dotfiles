return {
	"AckslD/nvim-neoclip.lua",
	-- need to lazy load, otherwise telescope sometimes deletes all history
	dependencies = {
		{ "kkharji/sqlite.lua", module = "sqlite" },
		{ "nvim-telescope/telescope.nvim" }, -- Required, but not stated here because it breaks things.
	},
	config = function()
		local function is_whitespace(line)
			return vim.fn.match(line, [[^\s*$]]) ~= -1
		end

		local function all(tbl, check)
			for _, entry in ipairs(tbl) do
				if not check(entry) then
					return false
				end
			end
			return true
		end
		require("neoclip").setup({
			enable_persistent_history = true,
			continuous_sync = true,
			filter = function(data)
				return not all(data.event.regcontents, is_whitespace)
			end,
			dedent_picker_display = true, --Removing leading whitespace.
			keys = {
				telescope = {
					i = {
						select = "<CR>",
						paste = "<C-y>",
						paste_behind = "<C-k>",
						custom = {},
					},
					n = {
						select = "<CR>",
						paste = "p",
						paste_behind = "P",
						custom = {},
					},
				},
			},
		})
		require("telescope").load_extension("neoclip")
	end,
}

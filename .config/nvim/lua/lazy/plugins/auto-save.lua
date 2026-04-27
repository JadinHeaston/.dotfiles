return {
	"okuuva/auto-save.nvim",
	version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
	cmd = "ASToggle", -- optional for lazy loading on command
	lazy = true,
	event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	opts = {
		enabled = false, -- Disabled by default.
		debounce_delay = 500, -- 1000 default
		condition = function()
			-- some recommended exclusions. you can use `:lua print(vim.bo.filetype)` to
			-- get the filetype string of the current buffer
			local excluded_filetypes = {
				-- this one is especially useful if you use neovim as a commit message editor
				"gitcommit",
				-- most of these are usually set to non-modifiable, which prevents autosaving
				-- by default, but it doesn't hurt to be extra safe.
				"NvimTree",
				"Outline",
				"TelescopePrompt",
				"alpha",
				"dashboard",
				"lazygit",
				"neo-tree",
				"oil",
				"prompt",
				"toggleterm",
			}

			local excluded_filenames = {
				-- add filenames here if you want
				"COMMIT_EDITMSG",
			}

			if
				vim.tbl_contains(excluded_filetypes, vim.bo.filetype)
				or vim.tbl_contains(excluded_filenames, vim.fn.expand("%:t"))
			then
				return false
			end
			return vim.bo.modified and vim.bo.buftype == ""
		end,
	},

	config = function(_, opts)
		require("auto-save").setup(opts)

		-- local group = vim.api.nvim_create_augroup("autosave", {})
		--
		-- vim.api.nvim_create_autocmd("User", {
		-- 	pattern = "AutoSaveEnable",
		-- 	group = group,
		-- 	callback = function()
		-- 		vim.notify("AutoSave enabled", vim.log.levels.INFO)
		-- 	end,
		-- })
		--
		-- vim.api.nvim_create_autocmd("User", {
		-- 	pattern = "AutoSaveDisable",
		-- 	group = group,
		-- 	callback = function()
		-- 		vim.notify("AutoSave disabled", vim.log.levels.INFO)
		-- 	end,
		-- })
	end,
}

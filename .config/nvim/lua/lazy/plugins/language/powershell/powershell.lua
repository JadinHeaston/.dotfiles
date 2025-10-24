return {
	"TheLeoP/powershell.nvim",
	lazy = true,
	---@type powershell.user_config
	opts = {
		bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
		shell = "powershell",
	},
	ft = { "ps1" }, -- Loads for Lua and Python files
}

return {
	{
		"barrett-ruth/live-server.nvim",
		build = "npm add -g live-server", --Requires NPM, can be changed.
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
	},
}

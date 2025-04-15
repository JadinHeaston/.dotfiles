return {
	{
		"f-person/git-blame.nvim",
		-- load the plugin at startup
		event = "VeryLazy",
		opts = {
			enabled = false, -- if you want to enable the plugin
			virtual_text_column = 80, -- virtual text start column, check Start virtual text at column section for more options

			message_template = "<summary> • <date> • <author> • <<sha>>",
			message_when_not_committed = "Not Committed",
			date_format = "%r",
			delay = 0,
		},
		keys = {
			{
				"<leader>tgb",
				function()
					require("gitblame").toggle()
				end,
				desc = "[T]oggle [g]it inline [b]lame",
			},
		},
	},
}

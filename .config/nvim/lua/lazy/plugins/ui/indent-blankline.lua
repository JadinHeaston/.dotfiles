return { -- Indent Rainbow
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = function(_, opts)
		return require("indent-rainbowline").make_opts({
			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
			},
		}, { --Indent Rainbowline config
			color_transparency = 0.03,
		})
	end,
	dependencies = {
		"TheGLander/indent-rainbowline.nvim",
	},
}

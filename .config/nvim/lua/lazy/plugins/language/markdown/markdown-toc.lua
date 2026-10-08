return {
	"hedyhli/markdown-toc.nvim",
	ft = "markdown",
	cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
	config = function()
		require("mtoc").setup({
			toc_list = {
				markers = '-'
			}
		})
	end,
}

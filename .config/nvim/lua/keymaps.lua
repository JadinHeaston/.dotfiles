-- [[ Basic Keymaps ]] See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Allowing Lazy to be closed with the Escape key.
local user_grp = vim.api.nvim_create_augroup("LazyUserGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lazy",
	desc = "Quit lazy with <esc>",
	callback = function()
		vim.keymap.set("n", "<esc>", function()
			vim.api.nvim_win_close(0, false)
		end, { buffer = true, nowait = true })
	end,
	group = user_grp,
})

-- Adding toggle to treesitter context lines.
vim.keymap.set("n", "<leader>tc", function()
	require("treesitter-context").toggle()
end, { desc = "[T]oggle [C]ontext lines" })

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>sh", function()
	require("telescope.builtin").help_tags()
end, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", function()
	require("telescope.builtin").keymaps()
end, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", function()
	require("telescope.builtin").find_files()
end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", function()
	require("telescope.builtin").builtin()
end, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", function()
	require("telescope.builtin").grep_string()
end, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", function()
	require("telescope.builtin").live_grep()
end, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", function()
	require("telescope.builtin").diagnostics()
end, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", function()
	require("telescope.builtin").resume()
end, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", function()
	require("telescope.builtin").oldfiles()
end, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", function()
	require("telescope.builtin").buffers()
end, { desc = "[ ] Find existing buffers" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = true,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.require("telescope.builtin").live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
	require("telescope.builtin").live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
		previewer = true,
	})
end, { desc = "[S]earch [/] in Open Files" })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
	require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim config" })

-- Opens Neoclip
vim.keymap.set(
	"n",
	"<leader>sc",
	"<cmd>lua require('telescope').extensions.neoclip.default()<CR>",
	{ noremap = true, silent = true, desc = "[S]earch [C]lipboard history" }
)

-- Toggle spell check
vim.keymap.set("n", "<leader>tsc", function()
	vim.wo.spell = not vim.wo.spell
	vim.cmd("redraw")
	print("Spell Check: " .. tostring(vim.wo.spell))
end, { desc = "[T]oggle [S]pell [C]heck" })

vim.keymap.set("n", "<leader>tww", function()
	vim.wo.wrap = not vim.wo.wrap
	vim.notify("Word Wrap: " .. tostring(vim.wo.wrap), vim.log.levels.INFO)
end, { desc = "[T]oggle [W]ord [W]rap" })

-- vim: ts=2 sts=2 sw=2 et

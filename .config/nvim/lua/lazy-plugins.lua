-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup(
	{
		-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
		"tpope/vim-sleuth",         -- Detect tabstop and shiftwidth automatically

		require 'lazy/plugins/which-key', -- Useful plugin to show you pending keybinds.
		require 'lazy/plugins/telescope', -- Fuzzy Finder (files, lsp, etc)
		require 'lazy/plugins/neoclip', -- Clipboard manager
		require 'lazy/plugins/oil', -- File explorer/editor
		require 'lazy/plugins/mini', -- Collection of various small independent plugins/modules

		-- LSP Plugins
		require 'lazy/plugins/language/lazydev', -- Lua LSP for Neovim config, runtime and plugins
		require 'lazy/plugins/language/lspconfig', -- Main LSP Configuration
		require 'lazy/plugins/language/conform', -- Autoformat
		require 'lazy/plugins/language/cmp',   -- Autocompletion
		require 'lazy/plugins/language/treesitter', -- Highlight, edit, and navigate code
		require 'lazy/plugins/language/live-server', -- Live server (HTML)

		-- UI
		require 'lazy/plugins/ui/catppuccin',   -- Theme
		require 'lazy/plugins/ui/treesitter-context', -- Adds context lines (Sticky Scroll) at the top when browsing nested content.
		require 'lazy/plugins/ui/todo-comments', -- Highlighting todo, notes, etc in comments
		require 'lazy/plugins/ui/noice',        -- Adding better notifications and command line.
		require 'lazy/plugins/ui/indent-blankline', -- Indent Rainbow
		require 'lazy/plugins/ui/rainbow-delimiters', -- Rainbow Brackets
		require 'lazy/plugins/ui/gitsigns',     --
		require 'lazy/plugins/ui/lazygit',      -- LazyGit integration
		require 'lazy/plugins/ui/git-blame',    -- Adding inline Git blames.

		-- Language Specific
		---- Markdown
		require 'lazy/plugins/language/markdown/markdown-preview', -- Adding markdown preview. Requires NPM, unknown if this can be changed.

		-- Misc
		require 'lazy/plugins/auto-pairs', -- Autocomplete for symbols

		-- Work In Progress
		require 'lazy/plugins/wip',
	},
	{
		ui = {
			-- If you are using a Nerd Font: set icons to an empty table which will use the
			-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
			icons = vim.g.have_nerd_font and {} or {
				cmd = "⌘",
				config = "🛠",
				event = "📅",
				ft = "📂",
				init = "⚙",
				keys = "🗝",
				plugin = "🔌",
				runtime = "💻",
				require = "🌙",
				source = "📄",
				start = "🚀",
				task = "📌",
				lazy = "💤 ",
			},
		},
	}
)

-- vim: ts=2 sts=2 sw=2 et

-- Handles installation of Lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Now lets set up all our plugins
local plugins = {
	"kassio/neoterm", --Get a terminal working inside vim (not using it, investigate and decide)
	"nvim-lualine/lualine.nvim", -- This is the status bar
	{ "catppuccin/nvim", name = "catppuccin" }, -- Purple theme for neovim
	"nvim-tree/nvim-tree.lua", -- This is the file navigator
	"lewis6991/gitsigns.nvim", -- This gives you some signs on the gutter that indicate what's new and what was moddified, etc in the file
	"tpope/vim-fugitive", -- This allows you to do git stuff from within vim
	"ap/vim-css-color", -- This previews hex colors on css
	"ryanoasis/vim-devicons", -- This are the development icons
	{ "mg979/vim-visual-multi", branch = "master" }, -- This allows for multiple cursors
	"sheerun/vim-polyglot", -- This allows highlighting for almost every language out there
	"windwp/nvim-autopairs", -- This allows autopais and works nice with the lsp
	"alvan/vim-closetag", -- This autocloses HTML tags
	"tpope/vim-surround", -- Allows surrounding selected text and other surrounding actions
	"neovim/nvim-lspconfig", -- This allows easier configuration for the language server protocol (LSP)
	"williamboman/nvim-lsp-installer", -- This allows you to install lsp servers in an easier way
	"hrsh7th/nvim-cmp", -- This provides autocompletion using native LSP
	"hrsh7th/cmp-nvim-lsp", -- This provides autocompletion using native LSP
	"hrsh7th/cmp-buffer", -- This provides autocompletion using native LSP
	"hrsh7th/cmp-path", -- This provides autocompletion using native LSP
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				ui = {
					code_action = "",
				},
			})
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" }, -- This gives you common snippets on the go, without you having to write them yourself
	}, -- This is the snippet engine
	"saadparwaiz1/cmp_luasnip", -- This is the snippet support forn nvim-cmp
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	"lewis6991/hover.nvim", -- Better hover, extra sources for hover
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- This is a nice dialog window that can do many nice things. We CAN have nice stuff you know.
	"nvim-lua/plenary.nvim", -- This is a required dependency of telescope.
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- This allows Telescope to use the fzf algorithm
	"numToStr/Comment.nvim", -- This allows commenting lines of code with shortcuts
	"yggdroot/indentline", -- This shows a line for each indentation
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- This provides better syntax highlighting
	{ "nvim-treesitter/nvim-treesitter-textobjects", dependencies = "nvim-treesitter/nvim-treesitter" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "williamboman/mason.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					graphql = { "prettier" },
					lua = { "stylua" },
					python = { "isort", "black" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
					async = false,
				},
			})
		end,
	}, -- Formatting using formatters
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				go = { "golangcilint" },
				python = { "pylint" },
			}
		end,
	}, -- linting using language specific linters
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
	}, -- Allows file operations in code. 9ike renaimg files. It pairs with nvim-tree
	"windwp/nvim-ts-autotag", -- Works with treesitter to autoclose tags in html, jsx, etc.
	"andymass/vim-matchup", -- This extends the functionality of % to code elements and tags
	{ "iamcco/markdown-preview.nvim", build = "cd app && yarn install " }, -- Live preview of markdown files (assumes you have node and yarn)
	"shatur/neovim-session-manager", -- Remembers your buffers and other nvim stuff from your previous session
	"epwalsh/obsidian.nvim", -- Supports navigationg an obsidian vault
	{ "glepnir/dashboard-nvim", event = "VimEnter" }, -- Get a visually pleasing dashboard when starting neovim
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
			"nvim-telescope/telescope-dap.nvim",
			"leoluz/nvim-dap-go",
			"jbyuki/one-small-step-for-vimkind",
			"mxsdev/nvim-dap-vscode-js",
			{
				"microsoft/vscode-js-debug",
				lazy = true,
				build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
			},
		},
		enable = true,
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	},
	{ "fatih/vim-go" },
	{
		"folke/zen-mode.nvim",
		opts = {
			-- leave it empty to use the default settings

			window = {
				backdrop = 0.6, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
				-- height and width can be:
				-- * an absolute number of cells when > 1
				-- * a percentage of the width / height of the editor when <= 1
				-- * a function that returns the width or the height
				width = 0.60, -- width of the Zen window
				height = 1, -- height of the Zen window
				-- by default, no options are changed for the Zen window
				-- uncomment any of the options below, or add other vim.wo options you want to apply
				options = {
					-- signcolumn = "no", -- disable signcolumn
					-- number = false, -- disable number column
					-- relativenumber = false, -- disable relative numbers
					-- cursorline = false, -- disable cursorline
					-- cursorcolumn = false, -- disable cursor column
					-- foldcolumn = "0", -- disable fold column
					-- list = false, -- disable whitespace characters
				},
			},
			plugins = {
				-- disable some global vim options (vim.o...)
				-- comment the lines to not apply the options
				options = {
					enabled = true,
					-- ruler = false,            -- disables the ruler text in the cmd line area
					-- showcmd = false,          -- disables the command in the last line of the screen
				},
				twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
				-- gitsigns = { enabled = false }, -- disables git signs
				-- tmux = { enabled = false }, -- disables the tmux statusline
				-- this will change the font size on kitty when in zen mode
				-- to make this work, you need to set the following kitty options:
				-- - allow_remote_control socket-only
				-- - listen_on unix:/tmp/kitty
				kitty = {
					enabled = false,
					font = "+4", -- font size increment
				},
				-- this will change the font size on alacritty when in zen mode
				-- requires  Alacritty Version 0.10.0 or higher
				-- uses `alacritty msg` subcommand to change font size
				alacritty = {
					enabled = false,
					font = "14", -- font size
				},
				-- this will change the font size on wezterm when in zen mode
				-- See alse also the Plugins/Wezterm section in this projects README
				wezterm = {
					enabled = false,
					-- can be either an absolute font size or the number of incremental steps
					font = "+4", -- (10% increase per step)
				},
			},
			-- callback where you can add custom code when the Zen window opens
			on_open = function(win) end,
			-- callback where you can add custom code when the Zen window closes
			on_close = function() end,
		},
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
require("plugins.plugins-config")

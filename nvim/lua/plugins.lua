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
	'kassio/neoterm',                                 --Get a terminal working inside vim (not using it, investigate and decide)
	'nvim-lualine/lualine.nvim',                      -- This is the status bar
	-- 'gruvbox-community/gruvbox',                           -- This is the Gruvbox colortheme for vim
	{ "catppuccin/nvim",        name = "catppuccin" }, -- Purple theme for neovim
	'nvim-tree/nvim-tree.lua',                        -- This is the file navigator
	'lewis6991/gitsigns.nvim',                        -- This gives you some signs on the gutter that indicate what's new and what was moddified, etc in the file
	'tpope/vim-fugitive',                             -- This allows you to do git stuff from within vim
	'ap/vim-css-color',                               -- This previews hex colors on css
	'ryanoasis/vim-devicons',                         -- This are the development icons
	{ 'mg979/vim-visual-multi', branch = 'master' },  -- This allows for multiple cursors
	'sheerun/vim-polyglot',                           -- This allows highlighting for almost every language out there
	'windwp/nvim-autopairs',                          -- This allows autopais and works nice with the lsp
	'alvan/vim-closetag',                             -- This autocloses HTML tags
	'tpope/vim-surround',                             -- Allows surrounding selected text and other surrounding actions
	'neovim/nvim-lspconfig',                          -- This allows easier configuration for the language server protocol (LSP)
	'williamboman/nvim-lsp-installer',                -- This allows you to install lsp servers in an easier way
	'hrsh7th/nvim-cmp',                               -- This provides autocompletion using native LSP
	'hrsh7th/cmp-nvim-lsp',                           -- This provides autocompletion using native LSP
	'hrsh7th/cmp-buffer',                             -- This provides autocompletion using native LSP
	'hrsh7th/cmp-path',                               -- This provides autocompletion using native LSP
	{
		'nvimdev/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({
				ui = {
					code_action = ''
				}
			})
		end,
		dependencies = {
			'nvim-tree/nvim-web-devicons' -- optional
		}
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" }, -- This gives you common snippets on the go, without you having to write them yourself

	},                                                 -- This is the snippet engine
	'saadparwaiz1/cmp_luasnip',                        -- This is the snippet support forn nvim-cmp
	'jose-elias-alvarez/null-ls.nvim',                 -- Gives the LSP support for third party formatters like prettier
	'jose-elias-alvarez/typescript.nvim',              -- Usefull extra stuff for typescript LSP
	-- {
	-- 	"fildo7525/pretty_hover",
	-- 	event = "LspAttach",
	-- 	opts = {}
	-- },                                                                     -- Nicer hover on your lsp
	'lewis6991/hover.nvim',                                                -- Better hover, extra sources for hover
	{ 'nvim-telescope/telescope.nvim',            branch = '0.1.x' },      -- This is a nice dialog window that can do many nice things. We CAN have nice stuff you know.
	'nvim-lua/plenary.nvim',                                               -- This is a required dependency of telescope.
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },        -- This allows Telescope to use the fzf algorithm
	'numToStr/Comment.nvim',                                               -- This allows commenting lines of code with shortcuts
	'yggdroot/indentline',                                                 -- This shows a line for each indentation
	-- 'puremourning/vimspector',                                             -- This is the debugger for vim
	{ 'nvim-treesitter/nvim-treesitter',             build = ':TSUpdate' }, -- This provides better syntax highlighting
	{ 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = "nvim-treesitter/nvim-treesitter" },
	{
		'prettier/vim-prettier',
		build = 'yarn install --frozen-lockfile --production'
	},                                                                    -- Vim plugin wrapper for prettier preconfigured with default settings
	'windwp/nvim-ts-autotag',                                             -- Works with treesitter to autoclose tags in html, jsx, etc.
	'andymass/vim-matchup',                                               -- This extends the functionality of % to code elements and tags
	{ 'iamcco/markdown-preview.nvim', build = 'cd app && yarn install ' }, -- Live preview of markdown files (assumes you have node and yarn)
	'shatur/neovim-session-manager',                                      -- Remembers your buffers and other nvim stuff from your previous session
	'epwalsh/obsidian.nvim',                                              -- Supports navigationg an obsidian vault
	{ 'glepnir/dashboard-nvim',       event = 'VimEnter' },               -- Get a visually pleasing dashboard when starting neovim
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
				build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
			},
		},
		enable = true,
	},
}

local opts = {}

require('lazy').setup(plugins, opts)
require('plugins.plugins-config')

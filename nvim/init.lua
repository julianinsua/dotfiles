--      ___________ - Written By Julian Insua
--     /__  __  __/ - Stolen from many others
--       / / / /    - File: init.lua
--  __  / / / /     - Date: 11/11/2022
-- / /_/ /_/ /__    - Comments: 104 years ago WWI ended
-- \____/______/    -

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.mouse = 'a'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ruler = true
vim.opt.showmatch = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes:2"
vim.opt.termguicolors = true
vim.opt.scrolloff = 4
vim.opt.ai = true
vim.opt.si = true
vim.o.undofile = true
vim.o.updatetime = 250

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'kassio/neoterm'                                                 --Get a terminal working inside vim (not using it, investigate and decide)
Plug 'nvim-lualine/lualine.nvim'                                      -- This is the status bar
Plug 'kyazdani42/nvim-web-devicons'                                   -- Icons for the statusbar
Plug 'gruvbox-community/gruvbox'                                      -- This is the Gruvbox colortheme for vim
Plug 'nvim-tree/nvim-tree.lua'                                        -- This is the file navigator
Plug 'lewis6991/gitsigns.nvim'                                        -- This gives you some signs on the gutter that indicate what's new and what was moddified, etc in the file
Plug 'tpope/vim-fugitive'                                             -- This allows you to do git stuff from within vim
Plug 'ap/vim-css-color'                                               -- This previews hex colors on css
Plug 'ryanoasis/vim-devicons'                                         -- This are the development icons
Plug('mg979/vim-visual-multi', { branch = 'master' })                 -- This allows for multiple cursors
Plug 'sheerun/vim-polyglot'                                           -- This allows higlighting for almost every language out there
Plug 'windwp/nvim-autopairs'                                          -- This allows autopais and works nice with the lsp
Plug 'alvan/vim-closetag'                                             -- This autocloses HTML tags
Plug 'tpope/vim-surround'                                             -- Allows surrounding selected text and other surrounding actions
Plug 'neovim/nvim-lspconfig'                                          -- This allows easier configuration for the language server protocol (LSP)
Plug 'williamboman/nvim-lsp-installer'                                -- This allows you to install lsp servers in an easier way
Plug 'hrsh7th/nvim-cmp'                                               -- This provides autocompletion using native LSP
Plug 'hrsh7th/cmp-nvim-lsp'                                           -- This provides autocompletion using native LSP
Plug 'hrsh7th/cmp-buffer'                                             -- This provides autocompletion using native LSP
Plug 'hrsh7th/cmp-path'                                               -- This provides autocompletion using native LSP
Plug 'hrsh7th/cmp-vsnip'                                              -- This is snippet support for nvim-cmp
Plug 'hrsh7th/vim-vsnip'                                              -- This is the snippet engine
Plug 'rafamadriz/friendly-snippets'                                   -- This gives you common snippets on the go, without you having to write them yourself
Plug 'jose-elias-alvarez/null-ls.nvim'                                --Gives the LSP support for third party formatters like prettier
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })           -- This is a nice dialog window that can do many nice things. We CAN have nice stuff you know.
Plug 'nvim-lua/plenary.nvim'                                          -- This is a required dependency of telescope.
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' }) -- This allows Telescope to use the fzf algorithm
-- Plug 'tpope/vim-commentary' -- This allows commenting lines of code with shortcuts
Plug 'numToStr/Comment.nvim'                                          -- This allows commenting lines of code with shortcuts
Plug 'yggdroot/indentline'                                            -- This shows a line for each indentation
Plug 'puremourning/vimspector'                                        -- This is the debugger for vim
-- Comented out plugins are for nvim-dap debugger. Couldn't make it work. I guess I'll try later.
-- Plug 'mfussenegger/nvim-dap' -- This is the Debugging tool that plays nice with nvim (pending)
-- Plug 'mxsdev/nvim-dap-vscode-js' -- Extension that allows you to use the vscode-js-debug adapter
-- Plug('microsoft/vscode-js-debug', { opt = true, run = 'npm install --legacy-peer-deps && npm run compile' })
-- Plug 'rcarriga/nvim-dap-ui' -- This is the UI for the nvim-dap debugger (plays nice with nvim)(pending)
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })                         -- This provides better sintax highlighting
Plug('prettier/vim-prettier', { ['do'] = 'yarn install --frozen-lockfile --production' }) -- Vim plugin wrapper for prettier preconfigured with default settings
Plug 'windwp/nvim-ts-autotag'                                                             -- Works with treesitter to autoclose tags in html, jsx, etc.
-- Plug 'thehamsta/nvim-dap-virtual-text' -- This allows nvim-dap to evaluate your code and show you a preview
Plug 'andymass/vim-matchup'                                                               -- This extends the functionality of % to code elements and tags
Plug('glacambre/firenvim', { ['do'] = function() vim.fn("firenvim#install(0)") end })
-- Plug('luk400/vim-jukit') --This lets you work with Jupyter notebooks and .ipynb files without leaving nvim (worked fine but had problems configuring maps in lua)
vim.call('plug#end')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_transparent_bg = '1'
vim.cmd('colorscheme gruvbox')

-- Function to return the total number of lines in a buffer in lualine
local totalLineNumber = function()
	return " " .. vim.fn.line('.') .. ' / ' .. vim.fn.line('$') .. " 並"
end

local currentBufferPath = function()
	return vim.fn.expand('%')
end

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'gruvbox-material',
		-- component_separators = { left = '', right = '' },
		component_separators = { left = ' ', right = ' ' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = { 'NvimTree' },
			tabline = { 'NvimTree' },
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = false,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		-- lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_b = { 'branch', 'diagnostics' },
		-- lualine_c = { currentBufferPath, 'filename' },
		lualine_c = { currentBufferPath },
		-- lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_x = { 'filetype' },
		lualine_y = { 'progress', totalLineNumber },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { currentBufferPath },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		lualine_a = { 'buffers' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { 'tabs' },
		lualine_z = {}
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

-- Configuration for GitSigns
require('gitsigns').setup {
	signs                        = {
		add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
		change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
		delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
		topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
		changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
		untracked    = { hl = 'GitSignsAdd', text = '┆', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
	},
	signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir                 = {
		interval = 1000,
		follow_files = true
	},
	attach_to_untracked          = true,
	current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts      = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
	sign_priority                = 6,
	update_debounce              = 100,
	status_formatter             = nil,  -- Use default
	max_file_length              = 40000, -- Disable if file is longer than this (in lines)
	preview_config               = {
		-- Options passed to nvim_open_win
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
	yadm                         = {
		enable = false
	},
}
-- LSP Configuration for different languages
local create_lsp_bindings = function(bufnr)
	local bufopts = function(desc)
		return { noremap = true, silent = true, buffer = bufnr, desc = desc }
	end
	vim.keymap.set('n', 'F', vim.lsp.buf.hover, bufopts('Hover documentation'))
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts('[G]o to [D]efinition'))
	vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, bufopts('[G]o to [T]ype definition')) -- This one is more for statically typed languages
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts('[G]o to [I]mplementation'))
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts('[R]e[N]ame'))
	vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next, bufopts('[E]rror [n]ext'))
	vim.keymap.set('n', '<leader>eN', vim.diagnostic.goto_prev, bufopts('[E]rror previous (shift-n)'))
	vim.keymap.set('n', '<leader>el', ':Telescope diagnostics<CR>', bufopts('[E]rror [List]')) --Lists all errors and lets you navigate the list with telescope
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts('[C]ode [A]ctions'))   --Lets you do stuff automatically like importing sth or organizing imports
end

require('nvim-lsp-installer').setup {}

-- This inserts a '(' after you select function or method item
require('nvim-autopairs').setup {}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)

local set_lsp_formatting = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('Format', { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ timeout_ms = 3000 })
				print('Format applied')
			end
		})
	end
end

local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local sources = {
	formatting.prettier,
	code_actions.eslint,
	code_actions.eslint_d
}

null_ls.setup({ sources = sources })

-- TYPESCRIPT
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').tsserver.setup {
	capabilities = capabilities,
	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact', 'javascript.jsx' },
	cmd = { 'typescript-language-server', '--stdio' },
	on_attach = function(client, bufnr)
		print('Typescript LSP attached')
		create_lsp_bindings(bufnr)
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('Format', { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.cmd('Prettier') --> Assumes you have vim-perttier, npm and yarn
			end
		})
	end,
}

-- PYTHON
require('lspconfig').pyright.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		print('pyright LSP attached')
		create_lsp_bindings(bufnr)
		set_lsp_formatting(client, bufnr)
	end,
}

-- LUA
require('lspconfig').lua_ls.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		print('LUA LSP attached')
		create_lsp_bindings(bufnr)
		set_lsp_formatting(client, bufnr)
	end,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

-- Configure nvim-cmp to work with lsp for autocompletion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup {
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-w>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
	}, {
		{ name = 'buffer' },
	})
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})


require 'nvim-treesitter.configs'.setup {
	ensure_installed = "all",          -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = { "sumneko_lua" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,                   -- false will disable the whole extension
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = 'gri', -- [gr]ab [i]nitialize
			node_incremental = 'grn', -- [gr] [n]ext node
			scope_incremental = 'grc', -- [gr]rab [c]ontext
			node_decremental = 'grm', -- [g]rab [r]e[m]ove node
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- you can use the capture groups defined in textobjects.scm
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jump = true,
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']m'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[m'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>a'] = '@parameter.inner',
			},
		},
	},
	additional_vim_regex_highlighting = false,
}

-- set up auto tag completion (this works with treesitter)
require('nvim-ts-autotag').setup()

-- setup comment.nvim
require('Comment').setup()

-- go to file, if it doesnt exist create it
vim.keymap.set('', 'gf', ':edit <cfile><CR>')

-- Navigate split buffers using Space h,l close with Space Q
vim.keymap.set('n', '<leader>l', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<leader>h', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', '<leader>Q', ':bdelete!<CR>', { silent = true })

-- Save all with Ctrl+s
vim.keymap.set('n', '<C-s>', ':wa<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:wa<CR>')

-- Navigate splits using Ctrl+h,j,k,l
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')

-- Resize splits with Alt+h,j,k,l [Normal Mode]
vim.keymap.set('n', '<M-h>', '<C-w><lt>')
vim.keymap.set('n', '<M-j>', '<C-w>-')
vim.keymap.set('n', '<M-k>', '<C-w>+')
vim.keymap.set('n', '<M-l>', '<C-w>>')

-- Move around with Alt+h,j,k,l [Insert Mode]
vim.keymap.set('i', '<M-h>', '<left>')
vim.keymap.set('i', '<M-j>', '<down>')
vim.keymap.set('i', '<M-k>', '<up>')
vim.keymap.set('i', '<M-l>', '<right>')

--Nvimtree configuration
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Open Nvimtree with Space t
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')

-- empty setup using defaults
require("nvim-tree").setup()

-- Telescope configuration
require('telescope').setup {
	defaults = {
		prompt_prefix = ' ',
		mappings = {
			n = {
				["cd"] = function(prompt_bufnr)
					local selection = require("telescope.actions.state").get_selected_entry()
					local dir = vim.fn.fnamemodify(selection.path, ":p:h")
					require("telescope.actions").close(prompt_bufnr)
					-- Depending on what you want put `cd`, `lcd`, `tcd`
					vim.cmd(string.format("silent lcd %s", dir))
				end,
				["dd"] = function(prompt_bufnr)
					local selection = require("telescope.actions.state").get_selected_entry()
					require("telescope.actions").close(prompt_bufnr)
					vim.api.nvim_buf_delete(selection.bufnr, { force = true })
				end
			}
		}
	}
}

require('telescope').load_extension('fzf')
local builtin = require('telescope.builtin')
-- Open Telescope and search git tree files with Space fg
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "find [G]it [F]iles" })

-- Open Telescope and find files in home directory with Space ff
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files cwd=~/<CR>', { desc = "find [F]iles" })

-- Open Telescope and find branches with Space fv
vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', { desc = "find [G]it [B]ranch" })

-- Open Telescope and search lines inside the current buffer with Space fl
vim.keymap.set('n', '<leader>l', builtin.current_buffer_fuzzy_find, { desc = "find [L]ine (current buffer)" })

-- Open Telescope with open buffers wit Space fb
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = "find open [B]uffer" })

-- Search text within files usinf fzf and ripgrep (rg) in Telescope with Space fL
vim.keymap.set('n', '<leader>L', builtin.live_grep, { desc = "find [L]ine (all git files)" })

--Search history with Space fh
vim.keymap.set('n', '<leader>h', builtin.oldfiles, { desc = "find in [H]istory" })

-- Search for references of the word under the cursor with Space fr
vim.keymap.set('n', '<leader>r', builtin.lsp_references, { desc = "find all [R]eferences" })

vim.g.vimspector_base_dir = '/home/julian/.config/nvim/plugged/vimspector'
vim.keymap.set('n', '<leader>da', ':call vimspector#Launch()<CR>')
vim.keymap.set('n', '<leader>dx', ':call vimspector#Reset()<CR>')
vim.keymap.set('n', '<S-k>', ':call vimspector#StepOut()<CR>')
vim.keymap.set('n', '<S-l>', ':call vimspector#StepInto()<CR>')
vim.keymap.set('n', '<S-j>', ':call vimspector#StepOver()<CR>')
vim.keymap.set('n', '<leader>d_', ':call vimspector#Restart()<CR>')
vim.keymap.set('n', '<leader>dn', ':call vimspector#Continue()<CR>')
vim.keymap.set('n', '<leader>drc', ':call vimspector#RunToCursor()<CR>')
vim.keymap.set('n', '<leader>dh', ':call vimspector#ToggleBreakpoint()<CR>')
vim.keymap.set('n', '<leader>de', ':call vimspector#ToggleConditionalBreakpoint()<CR>')
vim.keymap.set('n', '<leader>dX', ':call vimspector#ClearBreakpoints()<CR>')

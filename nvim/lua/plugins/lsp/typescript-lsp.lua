local util = require "plugins.lsp.util"

local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end

	return filtered
end

local function isNotReactDTS(value)
	return value:match("react/index.d.ts") == nil
end

local function on_list(options)
	local items = options.items
	if #items > 1 then
		items = filter(items, isNotReactDTS)
	end
	-- open a quick list with the results
	vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
	vim.api.nvim_command('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
end

local function go_to_definition()
	vim.lsp.buf.definition { on_list = on_list }
end

-- local create_lsp_bindings = function(bufnr)
-- 	local bufopts = function(desc)
-- 		return { noremap = true, silent = true, buffer = bufnr, desc = desc }
-- 	end
-- 	vim.keymap.set('n', 'F', "<cmd>Lspsaga hover_doc<cr>", bufopts('hover documentation'))
-- 	vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc ++keep<cr>", bufopts('hover documentation'))
-- 	-- vim.keymap.set('n', 'gd', go_to_definition, bufopts('[g]o to [d]efinition'))
-- 	vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', bufopts('[g]o to [d]efinition'))
-- 	vim.keymap.set('n', '<leader>gd', '<cmd>Lspsaga peek_definition<cr>', bufopts('[g]o to [d]efinition'))
-- 	vim.keymap.set('n', 'gt', '<cmd>Lspsaga goto_type_definition<cr>', bufopts('[g]o to [t]ype definition')) -- this one is more for statically typed languages
-- 	vim.keymap.set('n', '<leader>gt', '<cmd>Lspsaga peek_type_definition<cr>', bufopts('[g]o to [d]efinition'))
-- 	vim.keymap.set('n', 'gi', '<cmd>Lspsaga finder<cr>', bufopts('[g]o to [i]mplementation'))
-- 	vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', bufopts('[r]e[n]ame'))
-- 	vim.keymap.set('n', '<leader>en', '<cmd>Lspsaga diagnostic_jump_next<cr>', bufopts('[e]rror [n]ext'))
-- 	vim.keymap.set('n', '<leader>en', '<cmd>Lspsaga diagnostic_jump_prev<cr>', bufopts('[e]rror previous (shift-n)'))
-- 	vim.keymap.set('n', '<leader>el', '<cmd>Telescope diagnostics<cr>', bufopts('[e]rror [list]')) --lists all errors and lets you navigate the list with telescope
-- 	vim.keymap.set('n', '<leader>ca', "<cmd>Lspsaga code_action<cr>", bufopts('[c]ode [a]ctions')) --lets you do stuff automatically like importing sth or organizing imports
-- end


local function lsp_formatting(bufnr)
	vim.api.nvim_create_autocmd('BufWritePre', {
		group = vim.api.nvim_create_augroup('format', { clear = true }),
		buffer = bufnr,
		callback = function()
			vim.cmd('Prettier') --> assumes you have vim-perttier, a global prettier instance, npm and yarn
		end
	})
end

-- Auto add curly braces on props
local function add_curly_braces()
	-- The cursor location does not give us the correct node in this case, so we
	-- need to get the node to the left of the cursor
	print('sth')
	local cursor = vim.api.nvim_win_get_cursor(0)
	local left_of_cursor_range = { cursor[1] - 1, cursor[2] - 1 }

	local node = vim.treesitter.get_node { pos = left_of_cursor_range }
	local nodes_active_in = {
		'property_identifier',
		'directive_argument',
		'directive_name',
	}
	if not node or not vim.tbl_contains(nodes_active_in, node:type()) then
		-- The cursor is not on an attribute node
		return '='
	end

	return '={}<left>'
end

-- typescript
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- VANILLA LSP CONFIG
-- require('lspconfig').tsserver.setup {
-- 	capabilities = capabilities,
-- 	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact', 'javascript.jsx' },
-- 	cmd = { 'typescript-language-server', '--stdio' },
-- 	on_attach = function(client, bufnr)
-- 		print('typescript lsp attached')
-- 		create_lsp_bindings(bufnr)
-- 		lsp_formatting(bufnr)
-- 		vim.keymap.set('i', '=', add_curly_braces, { expr = true, buffer = true })
-- 	end,
-- }

-- TYPESCRIPT.NVIM CONFIG
require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false,           -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true,       -- fall back to standard LSP definition on failure
	},
	server = {               -- pass options to lspconfig's setup method
		capabilities = capabilities,
		filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact', 'javascript.jsx' },
		cmd = { 'typescript-language-server', '--stdio' },
		on_attach = function(client, bufnr)
			print('typescript lsp attached')
			util.create_lsp_bindings(bufnr)
			vim.keymap.set('n', '<leader><M-l>', "<cmd>Lspsaga outline<cr>",
				{ noremap = true, silent = false, buffer = bufnr, desc = 'Show file out[L]ine' })
			-- Show an outline of the methods and symbols of the document
			lsp_formatting(bufnr)
			vim.keymap.set('i', '=', add_curly_braces, { expr = true, buffer = true })
		end,
		settings = {
			-- specify some or all of the following settings if you want to adjust the default behavior
			javascript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
			typescript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
		},
	},
})

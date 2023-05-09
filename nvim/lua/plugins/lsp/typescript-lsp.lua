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

local create_lsp_bindings = function(bufnr)
	local bufopts = function(desc)
		return { noremap = true, silent = true, buffer = bufnr, desc = desc }
	end
	vim.keymap.set('n', 'F', vim.lsp.buf.hover, bufopts('hover documentation'))
	vim.keymap.set('n', 'gd', go_to_definition, bufopts('[g]o to [d]efinition'))
	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts('[g]o to [t]ype definition')) -- this one is more for statically typed languages
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts('[g]o to [i]mplementation'))
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts('[r]e[n]ame'))
	vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next, bufopts('[e]rror [n]ext'))
	vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_prev, bufopts('[e]rror previous (shift-n)'))
	vim.keymap.set('n', '<leader>el', '<cmd>Telescope diagnostics<cr>', bufopts('[e]rror [list]')) --lists all errors and lets you navigate the list with telescope
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts('[c]ode [a]ctions'))       --lets you do stuff automatically like importing sth or organizing imports
end


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
require('lspconfig').tsserver.setup {
	capabilities = capabilities,
	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact', 'javascript.jsx' },
	cmd = { 'typescript-language-server', '--stdio' },
	on_attach = function(client, bufnr)
		print('typescript lsp attached')
		create_lsp_bindings(bufnr)
		lsp_formatting(bufnr)
		vim.keymap.set('i', '=', add_curly_braces, { expr = true, buffer = true })
	end,
}

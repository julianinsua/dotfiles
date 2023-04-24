-- lsp configurations for different languages
local create_lsp_bindings = function(bufnr)
	local bufopts = function(desc)
		return { noremap = true, silent = false, buffer = bufnr, desc = desc }
	end
	vim.keymap.set('n', 'F', vim.lsp.buf.hover, bufopts('hover documentation'))
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts('[g]o to [d]efinition'))
	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts('[g]o to [t]ype definition')) -- this one is more for statically typed languages
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts('[g]o to [i]mplementation'))
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts('[r]e[n]ame'))
	vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next, bufopts('[e]rror [n]ext'))
	vim.keymap.set('n', '<leader>eN', vim.diagnostic.goto_prev, bufopts('[e]rror previous (shift-n)'))
	vim.keymap.set('n', '<leader>el', ':Telescope diagnostics<cr>', bufopts('[e]rror [list]')) --lists all errors and lets you navigate the list with telescope
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts('[c]ode [a]ctions'))   --lets you do stuff automatically like importing sth or organizing imports
end

local set_lsp_formatting = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('format', { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format()
				print('Code reformatted by LSP')
			end
		})
	end
end

return {create_lsp_bindings = create_lsp_bindings, set_lsp_formatting = set_lsp_formatting}

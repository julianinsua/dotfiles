local util =require('plugins.lsp.util')

-- local create_lsp_bindings = function(bufnr)
-- 	local bufopts = function(desc)
-- 		return { noremap = true, silent = true, buffer = bufnr, desc = desc }
-- 	end
-- 	vim.keymap.set('n', 'f', vim.lsp.buf.hover, bufopts('hover documentation'))
-- 	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts('[g]o to [d]efinition'))
-- 	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts('[g]o to [t]ype definition')) -- this one is more for statically typed languages
-- 	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts('[g]o to [i]mplementation'))
-- 	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts('[r]e[n]ame'))
-- 	vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next, bufopts('[e]rror [n]ext'))
-- 	vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_prev, bufopts('[e]rror previous (shift-n)'))
-- 	vim.keymap.set('n', '<leader>el', ':telescope diagnostics<cr>', bufopts('[e]rror [list]')) --lists all errors and lets you navigate the list with telescope
-- 	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts('[c]ode [a]ctions'))   --lets you do stuff automatically like importing sth or organizing imports
-- end
--
--
-- local set_lsp_formatting = function(client, bufnr)
-- 	if client.server_capabilities.documentformattingprovider then
-- 		vim.api.nvim_create_autocmd('bufwritepre', {
-- 			group = vim.api.nvim_create_augroup('format', { clear = true }),
-- 			buffer = bufnr,
-- 			callback = function()
-- 				vim.lsp.buf.format({ timeout_ms = 5000 })
-- 				print('format applied')
-- 			end
-- 		})
-- 	end
-- end

-- python
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').pyright.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		print('pyright lsp attached')
		util.create_lsp_bindings(bufnr)
		util.set_lsp_formatting(client, bufnr)
	end,
}


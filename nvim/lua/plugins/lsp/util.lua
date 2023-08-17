-- lsp configurations for different languages
local create_lsp_bindings = function(bufnr)
	local bufopts = function(desc)
		return { noremap = true, silent = false, buffer = bufnr, desc = desc }
	end
	vim.keymap.set('n', 'F', "<cmd>Lspsaga hover_doc<cr>", bufopts('hover documentation'))
	vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc ++keep<cr>", bufopts('hover documentation andd [K]eep it'))
	vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', bufopts('[g]o to [d]efinition'))
	vim.keymap.set('n', '<leader>gd', '<cmd>Lspsaga peek_definition<cr>', bufopts('Peek [Leader] [g]o to [d]efinition'))
	vim.keymap.set('n', 'gt', '<cmd>Lspsaga goto_type_definition<cr>', bufopts('[g]o to [t]ype definition')) -- this one is more for statically typed languages
	vim.keymap.set('n', '<leader>gt', '<cmd>Lspsaga peek_type_definition<cr>',
		bufopts('Peek [Leader] [g]o to [t]ype definition'))
	vim.keymap.set('n', 'gi', '<cmd>Lspsaga finder<cr>', bufopts('[g]o to [i]mplementation'))
	vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', bufopts('[r]e[n]ame'))
	vim.keymap.set('n', '<leader>en', '<cmd>Lspsaga diagnostic_jump_next<cr>', bufopts('[e]rror [n]ext'))
	vim.keymap.set('n', '<leader>eN', '<cmd>Lspsaga diagnostic_jump_prev<cr>', bufopts('[e]rror previous (shift-n)'))
	vim.keymap.set('n', '<leader>el', '<cmd>Telescope diagnostics<cr>', bufopts('[e]rror [list]')) --lists all errors and lets you navigate the list with telescope
	vim.keymap.set('n', '<leader>ca', "<cmd>Lspsaga code_action<cr>", bufopts('[c]ode [a]ctions')) --lets you do stuff automatically like importing sth or organizing imports
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

return { create_lsp_bindings = create_lsp_bindings, set_lsp_formatting = set_lsp_formatting }

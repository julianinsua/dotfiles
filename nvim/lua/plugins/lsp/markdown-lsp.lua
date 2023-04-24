-- Configuration for markdoen lsp (marksman)
local util = require('plugins.lsp.util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').marksman.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		print('markdown lsp attached (marksman)')
		util.create_lsp_bindings(bufnr)
		util.set_lsp_formatting(client, bufnr)
		vim.keymap.set('n', 'gf', '<cmd>ObsidianFollowLink<cr>', {noremap = true, silent = true, buffer = bufnr, desc = "[G]o to Obsidian [F]ile"})
	end
}

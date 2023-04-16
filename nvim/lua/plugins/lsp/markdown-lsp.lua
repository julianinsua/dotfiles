local util = require('plugins.lsp.util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').marksman.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		print('markdown lsp attached (marksman)')
		util.create_lsp_bindings(bufnr)
		util.set_lsp_formatting(client, bufnr)
	end
}

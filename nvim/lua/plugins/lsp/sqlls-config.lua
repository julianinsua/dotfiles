local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').sqlls.setup {
	capabilities = capabilities,
	on_attach = function (client, bufnr)
		print('sql lsp attached (sqlls)')
	end
}

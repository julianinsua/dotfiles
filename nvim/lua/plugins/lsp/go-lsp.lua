local lsputil = require('lspconfig.util')
local util = require('plugins.lsp.util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').gopls.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		util.create_lsp_bindings(bufnr)
		util.set_lsp_formatting(client, bufnr)
		print('go lsp attached (gopls)')
	end,
	cmd = { 'gopls' },
	filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
	root_dir = lsputil.root_pattern('go.work', 'go.mod', '.git'),
	settings = {
		gopls = {
			completeUnimported = true,
		}
	}
}

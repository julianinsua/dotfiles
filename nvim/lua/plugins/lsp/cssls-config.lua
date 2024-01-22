local create_lsp_bindings = require("plugins.lsp.util").create_lsp_bindings()
local capabilities = vim.lsp.protocol.make_client_capabilities()

require("lspconfig").cssls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		create_lsp_bindings(bufnr)
	end,
})

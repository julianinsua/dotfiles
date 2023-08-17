local util = require('plugins.lsp.util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').prismals.setup {}
-- require('lspconfig').prismals.setup {
-- 	capabilities = capabilities,
-- 	on_attach = function(client, bufnr)
-- 		util.create_lsp_bindings(bufnr)
-- 		util.set_lsp_formatting(client, bufnr)
-- 		print('prisma lsp attached')
-- 	end,
-- }

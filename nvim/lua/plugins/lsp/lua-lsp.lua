local util = require('plugins.lsp.util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		util.create_lsp_bindings(bufnr)
		util.set_lsp_formatting(client, bufnr)
		print('lua lsp attached')
	end,
	settings = {
		Lua = {
			runtime = {
				-- tell the language server which version of lua you're using (most likely luajit in the case of neovim)
				version = 'luajit',
			},
			diagnostics = {
				-- get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- make the server aware of neovim runtime files
				library = vim.api.nvim_get_runtime_file("lua", true),
			},
			-- do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

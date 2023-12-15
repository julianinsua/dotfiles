local create_lsp_bindings = require("plugins.lsp.util").create_lsp_bindings
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- local function lsp_formatting(bufnr)
-- 	vim.api.nvim_create_autocmd('BufWritePre', {
-- 		group = vim.api.nvim_create_augroup('format', { clear = true }),
-- 		buffer = bufnr,
-- 		callback = function()
-- 			vim.cmd('Prettier') --> assumes you have vim-perttier, a global prettier instance, npm and yarn
-- 		end
-- 	})
-- end

local function add_trailing_comma_on_new_line()
	local line = vim.api.nvim_get_current_line()
	local should_add_comma = string.find(line, "[^,{[]$")

	if should_add_comma then
		return "A,<cr>"
	else
		return "o"
	end
end

require("lspconfig").jsonls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		create_lsp_bindings(bufnr)
		-- lsp_formatting(bufnr)
		vim.keymap.set("n", "o", add_trailing_comma_on_new_line, { buffer = true, expr = true })
	end,
})

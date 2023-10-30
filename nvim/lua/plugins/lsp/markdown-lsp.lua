-- Configuration for markdoen lsp (marksman)
local util = require('plugins.lsp.util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').remark_ls.setup {
	capabilities = capabilities,
	-- settings = {
	-- 	requireConfig = true,
	-- },
	on_attach = function(client, bufnr)
		print('markdown lsp attached (marksman)')
		util.create_lsp_bindings(bufnr)
		-- Get a table of contents in MD files with Space Alt+l
		vim.keymap.set('n', '<leader><M-l>', function()
			vim.cmd("Toc")
			vim.cmd("vertical resize 60")
		end, { noremap = true, desc = "Display Table of contents" })
		util.set_lsp_formatting(client, bufnr)
		vim.keymap.set('n', 'gf', '<cmd>ObsidianFollowLink<cr>',
			{ noremap = true, silent = true, buffer = bufnr, desc = "[G]o to Obsidian [F]ile" })
	end
}

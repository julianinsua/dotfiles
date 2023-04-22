require('nvim-lsp-installer').setup {}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)

require('plugins.lsp.typescript-lsp')
require('plugins.lsp.python-lsp')
require('plugins.lsp.lua-lsp')
require('plugins.lsp.markdown-lsp')

-- configure nvim-cmp to work with lsp for autocompletion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup {
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<c-b>'] = cmp.mapping.scroll_docs(-4),
		['<c-f>'] = cmp.mapping.scroll_docs(4),
		['<c-w>'] = cmp.mapping.complete(),
		['<c-e>'] = cmp.mapping.abort(),
		['<cr>'] = cmp.mapping.confirm({ select = true }), -- accept currently selected item. set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, --> for vsnip users.
	}, {
		{ name = 'buffer' },
	})
}

-- set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- you can specify the `cmp_git` source if you installed it.
	}, {
		{ name = 'buffer' },
	})
})

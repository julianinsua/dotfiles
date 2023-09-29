-- Configure autopairs with cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)

-- configure nvim-cmp to work with lsp for autocompletion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Get icons for Types
local icons = require("plugins.lsp.cmp-icons").icons

cmp.setup {
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = vim_item.kind
			local source = entry.source.name
			local item = entry:get_completion_item()
			vim_item.kind = (icons[kind] or "") .. " " .. "[" .. (icons[source] or "p") .. "]"
			vim_item.menu = "(" .. kind .. ")"
			return vim_item
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<c-b>'] = cmp.mapping.scroll_docs(-4),
		['<c-f>'] = cmp.mapping.scroll_docs(4),
		['<c-w>'] = cmp.mapping.complete(),
		['<c-e>'] = cmp.mapping.abort(),
		['<tab>'] = cmp.mapping.confirm({ select = true }), -- accept currently selected item. set `select` to `false` to only confirm explicitly selected items.
		['<c-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior, count = 1 }),
		['<c-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior, count = 1 }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip', option = { show_autosnippets = true } }, --> for luasnip users.
	}, {
		{ name = 'buffer' },
		{ name = 'path' },
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

-- Setup command line
-- cmp.setup.cmdline(':', {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = 'path' }
-- 	}, {
-- 		{ name = 'cmdline' }
-- 	})
-- })

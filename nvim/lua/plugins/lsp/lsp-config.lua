-- lsp configuration for different languages
local create_lsp_bindings = function(bufnr)
	local bufopts = function(desc)
		return { noremap = true, silent = true, buffer = bufnr, desc = desc }
	end
	vim.keymap.set('n', 'f', vim.lsp.buf.hover, bufopts('hover documentation'))
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts('[g]o to [d]efinition'))
	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts('[g]o to [t]ype definition')) -- this one is more for statically typed languages
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts('[g]o to [i]mplementation'))
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts('[r]e[n]ame'))
	vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next, bufopts('[e]rror [n]ext'))
	vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_prev, bufopts('[e]rror previous (shift-n)'))
	vim.keymap.set('n', '<leader>el', ':telescope diagnostics<cr>', bufopts('[e]rror [list]')) --lists all errors and lets you navigate the list with telescope
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts('[c]ode [a]ctions'))   --lets you do stuff automatically like importing sth or organizing imports
end

require('nvim-lsp-installer').setup {}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)

local set_lsp_formatting = function(client, bufnr)
	if client.server_capabilities.documentformattingprovider then
		vim.api.nvim_create_autocmd('bufwritepre', {
			group = vim.api.nvim_create_augroup('format', { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ timeout_ms = 5000 })
				print('format applied')
			end
		})
	end
end

local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local sources = {
	formatting.prettier,
	code_actions.eslint,
	code_actions.eslint_d
}

null_ls.setup({ sources = sources })

require('plugins.lsp.typescript-lsp')
require('plugins.lsp.python-lsp')
require('plugins.lsp.lua-lsp')

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
		['<cr>'] = cmp.mapping.confirm({ select = false }), -- accept currently selected item. set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- for vsnip users.
	}, {
		{ name = 'buffer' },
	})
}

-- set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- you can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

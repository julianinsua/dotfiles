local ls = require 'luasnip'
-- Enable autosnippets
ls.config.set_config({
	enable_autosnippets = true
})

-- Enable VS Code like snippets (friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()

-- Custom snippets
require("luasnip.loaders.from_vscode").load({paths = {'./lua/plugins/snippets/snips/'}})

-- Get react snippets on .js files
ls.filetype_extend("javascript", { "javascriptreact" })

local s = ls.s
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node

ls.add_snippets('lua', {
	s(
		{
			trig = 'if',
			condition = function()
				local ignored_nodes = { 'string', 'comment' }

				local pos = vim.api.nvim_win_get_cursor(0)
				-- Use one column to the left of the cursor to avoid a "chunk" node
				-- type. Not sure what it is, but it seems to be at the end of lines in
				-- some cases.
				local row, col = pos[1] - 1, pos[2] - 1

				local node_type = vim.treesitter
						.get_node({
							pos = { row, col },
						})
						:type()
				-- This needs more conditions from treesitter, so that the `if`
				-- autosnippet only triggers when it makes sense
				return not vim.tbl_contains(ignored_nodes, node_type)
			end,
		},
		fmt(
			[[
if {} then
  {}
end
  ]],
			{ i(1), i(2) }
		)
	),
}, {
	type = 'autosnippets',
})

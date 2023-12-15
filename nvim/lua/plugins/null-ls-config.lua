local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions --> Gives solutions
local formatting = null_ls.builtins.formatting     --> Make stuff look pretty
local diagnostics = null_ls.builtins.diagnostics   --> Shows errors

local sources = {
	formatting.prettier,
	code_actions.eslint_d,
	code_actions.cspell.with({ filetypes = { "markdown" } }),
	diagnostics.eslint_d,
	diagnostics.write_good.with({ filetypes = { "markdown" } }),
	diagnostics.cspell.with({ filetypes = { "markdown" } }),
	diagnostics.codespell,
}

null_ls.setup({ sources = sources })

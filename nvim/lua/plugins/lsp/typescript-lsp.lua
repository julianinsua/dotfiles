local util = require('plugins.lsp.util')

local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function isNotReactDTS(value)
	return value:match("react/index.d.ts") == nil
end

local function on_list (options)
	local items = options.items
	if #items > 1 then
		items = filter(items, isNotReactDTS)
	end
	-- open a quick list with the results
	vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
  vim.api.nvim_command('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
end

local function go_to_definition ()
	vim.lsp.buf.definition{ on_list = on_list }
end

local function lsp_formatting(bufnr)
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('format', { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.cmd('Prettier') --> assumes you have vim-perttier, a global prettier instance, npm and yarn
			end
		})
end

-- typescript
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').tsserver.setup {
	capabilities = capabilities,
	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact', 'javascript.jsx' },
	cmd = { 'typescript-language-server', '--stdio' },
	on_attach = function(client, bufnr)
		print('typescript lsp attached')
		util.create_lsp_bindings(bufnr)
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('format', { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.cmd('Prettier') --> assumes you have vim-perttier, a global prettier instance, npm and yarn
				print('Code reformated by Prettier')
			end
		})
	end,
}

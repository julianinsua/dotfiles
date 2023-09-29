local f = function()
	local x = 5
	print(x)
end

function ChangeLSPNameFunction()
	local position_params = vim.lsp.util.make_position_params()
	local new_name = vim.fn.input("New name for file: ")


	print(vim.inspect(position_params.textDocument.uri))
	vim.lsp.util.rename()
end

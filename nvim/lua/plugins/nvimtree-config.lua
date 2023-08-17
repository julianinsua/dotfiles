local api = require('nvim-tree.api')

--nvimtree configuration
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1

-- open nvimtree with space t
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<cr>')

local function renameTSFile(source)
	local node = api.tree.get_node_under_cursor()
	local path = node.absolute_path
	local newName = vim.fn.input("New name: ")
	local newPath = source:gmatch("(.-)([^\\/]-%.?([^%.\\/]*))$")
	for _, val in ipairs(newPath) do
		print(val)
	end
	-- require("typescript").renameFile(source, target)
end

require("nvim-tree").setup({
	on_attach = function(bufnr)
		api.config.mappings.default_on_attach(bufnr)
		vim.keymap.set("n", "<M-r>", renameTSFile)
	end
})

--nvimtree configuration
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1

-- open nvimtree with space t
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<cr>')

-- empty setup using defaults
require("nvim-tree").setup({
	-- update_cwd = true,
	--  update_focused_file = {
 --    enable      = true,
	-- }
})

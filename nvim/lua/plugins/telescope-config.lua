local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

-- telescope configuration
require('telescope').setup {
	defaults = {
		prompt_prefix = ' ',
		mappings = {
			n = {
				["cd"] = function(prompt_bufnr)
					local selection = require("telescope.actions.state").get_selected_entry()
					local dir = vim.fn.fnamemodify(selection.path, ":p:h")
					require("telescope.actions").close(prompt_bufnr)
					-- depending on what you want put `cd`, `lcd`, `tcd`
					vim.cmd(string.format("silent lcd %s", dir))
				end,
				["dd"] = function(prompt_bufnr)
					local current_picker = action_state.get_current_picker(prompt_bufnr)
					local multi_selections = current_picker:get_multi_selection()

					if next(multi_selections) == nil then
						local selection = action_state.get_selected_entry()
						actions.close(prompt_bufnr)
						vim.api.nvim_buf_delete(selection.bufnr, { force = true })
					else
						actions.close(prompt_bufnr)
						for _, selection in ipairs(multi_selections) do
							vim.api.nvim_buf_delete(selection.bufnr, { force = true })
						end
					end
				end
			}
		}
	}
}

require('telescope').load_extension('fzf')
local builtin = require('telescope.builtin')

-- KEYBINDINGS
-- open telescope and search git tree files with space fg
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "find [g]it [f]iles" })

-- open telescope and find files in home directory with space ff
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files cwd=~/<cr>', { desc = "find [f]iles" })

-- open telescope and find branches with space fv
vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', { desc = "find [g]it [b]ranch" })

-- open telescope and search lines inside the current buffer with space fl
vim.keymap.set('n', '<leader>l', builtin.current_buffer_fuzzy_find, { desc = "find [l]ine (current buffer)" })

-- open telescope with open buffers wit space fb
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = "find open [b]uffer" })

-- search text within files usinf fzf and ripgrep (rg) in telescope with space fl
vim.keymap.set('n', '<leader>l', builtin.live_grep, { desc = "find [l]ine (all git files)" })

--search history with space fh
vim.keymap.set('n', '<leader>h', builtin.oldfiles, { desc = "find in [h]istory" })

-- search for references of the word under the cursor with space fr
vim.keymap.set('n', '<leader>r', builtin.lsp_references, { desc = "find all [r]eferences" })

-- ACTIONS
-- local action_state = require('telescope.actions.state')
-- local actions = require('telescope.actions')
--
-- builtin.buffers(require('telescope.themes').get_dropdown({
-- 	attach_mappings = function(prompt_bufnr, map)
-- 		local delete_buffer = function()
-- 			local current_picker = action_state.get_current_picker(prompt_bufnr)
-- 			local multi_selections = current_picker:get_multi_selection()
--
-- 			if next(multi_selections) == nil then
-- 				local selection = action_state.get_selected_entry()
-- 				actions.close(prompt_bufnr)
-- 				vim.api.nvim_buf_delete(selection.bufnr, { force = true })
-- 			else
-- 				print("multi")
-- 				actions.close(prompt_bufnr)
-- 				for _, selection in ipairs(multi_selections) do
-- 					vim.api.nvim_buf_delete(selection.bufnr, { force = true })
-- 				end
-- 			end
-- 		end
--
-- 		map('n', 'dd', delete_buffer)
-- 		return true
-- 	end
-- }))

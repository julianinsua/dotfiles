-- function to return the total number of lines in a buffer in lualine
local totalLineNumber = function()
	return " " .. vim.fn.line('.') .. ' / ' .. vim.fn.line('$') .. " 並"
end

local currentBufferPath = function()
	return vim.fn.expand('%')
end

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'gruvbox-material',
		-- component_separators = { left = '', right = '' },
		component_separators = { left = ' ', right = ' ' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = { 'NVimTree' },
			tabline = { 'NVimTree' },
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = false,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		-- lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_b = { 'branch', 'diagnostics' },
		-- lualine_c = { currentbufferpath, 'filename' },
		lualine_c = { currentBufferPath },
		-- lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_x = { 'filetype' },
		lualine_y = { 'progress', totalLineNumber },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { currentBufferPath },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		lualine_a = { 'buffers' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {'tabs'}
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}


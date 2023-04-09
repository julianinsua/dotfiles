-- configuration for gitsigns
require('gitsigns').setup {
	signs                        = {
		add          = { hl = 'gitsignsadd', text = '│', numhl = 'gitsignsaddnr', linehl = 'gitsignsaddln' },
		change       = { hl = 'gitsignschange', text = '│', numhl = 'gitsignschangenr', linehl = 'gitsignschangeln' },
		delete       = { hl = 'gitsignsdelete', text = '_', numhl = 'gitsignsdeletenr', linehl = 'gitsignsdeleteln' },
		topdelete    = { hl = 'gitsignsdelete', text = '‾', numhl = 'gitsignsdeletenr', linehl = 'gitsignsdeleteln' },
		changedelete = { hl = 'gitsignschange', text = '~', numhl = 'gitsignschangenr', linehl = 'gitsignschangeln' },
		untracked    = { hl = 'gitsignsadd', text = '┆', numhl = 'gitsignsaddnr', linehl = 'gitsignsaddln' },
	},
	signcolumn                   = true, -- toggle with `:gitsigns toggle_signs`
	numhl                        = false, -- toggle with `:gitsigns toggle_numhl`
	linehl                       = false, -- toggle with `:gitsigns toggle_linehl`
	word_diff                    = false, -- toggle with `:gitsigns toggle_word_diff`
	watch_gitdir                 = {
		interval = 1000,
		follow_files = true
	},
	attach_to_untracked          = true,
	current_line_blame           = false, -- toggle with `:gitsigns toggle_current_line_blame`
	current_line_blame_opts      = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = '<author>, <author_time:%y-%m-%d> - <summary>',
	sign_priority                = 6,
	update_debounce              = 100,
	status_formatter             = nil,  -- use default
	max_file_length              = 40000, -- disable if file is longer than this (in lines)
	preview_config               = {
		-- options passed to nvim_open_win
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
	yadm                         = {
		enable = false
	},
}

-- Highlighting and other code parsing actions
require 'nvim-treesitter.configs'.setup {
	ensure_installed = "all",       -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = { }, -- list of parsers to ignore installing, I dont like how TS does markdown
	highlight = {
		enable = true,                -- false will disable the whole extension
		additional_vim_regex_highlighting = true
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = 'gri', -- [gr]ab [i]nitialize
			node_incremental = 'grn', -- [gr]ab [n]ext node
			scope_incremental = 'grc', -- [gr]ab [c]ontext
			node_decremental = 'grm', -- [g]rab [r]e[m]ove node
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- you can use the capture groups defined in textobjects.scm
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jump = true,
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']m'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[m'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
	},
	additional_vim_regex_highlighting = false,
}

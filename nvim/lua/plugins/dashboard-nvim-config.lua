local header = {
 "______ ",
 "/     /\\ ",
 "/     /##\\ ",
 "/     /####\\ ",
 "/     /######\\ ",
 "/     /########\\ ",
 "/     /##########\\ ",
 "/     /#####/\\#####\\ ",
 "/     /#####/++\\#####\\ ",
 "/     /#####/++++\\#####\\ ",
 "/     /#####/\\+++++\\#####\\ ",
 "/     /#####/  \\+++++\\#####\\ ",
 "/     /#####/    \\+++++\\#####\\ ",
 "/     /#####/      \\+++++\\#####\\ ",
 "/     /#####/        \\+++++\\#####\\ ",
 "/     /#####/__________\\+++++\\#####\\ ",
 "/                        \\+++++\\#####\\ ",
 "/__________________________\\+++++\\####/ ",
 "\\+++++++++++++++++++++++++++++++++\\##/ ",
 "\\+++++++++++++++++++++++++++++++++\\/ ",
 "`````````````````````````````````` ",
 "",
 "",
 "",
 "",
}

require('dashboard').setup({
	theme = 'doom',
		config = {
			header = header,
			center = {
				{
					icon = ' ',
					icon_hl = 'Title',
					desc = 'SESSIONS',
					desc_hl = 'String',
				},
				{
					desc = '\t Last session',
					key = 'a',
					keymap = 'SPC s L',
					key_hl = 'Number',
					action = 'SessionManager load_last_session'
				},
				{
					desc = '\t Last session (current dir)',
					key = 'b',
					keymap = 'SPC s l',
					key_hl = 'Number',
					action = 'SessionManager load_current_dir_session'
				},
				{
					icon = ' ',
					desc = 'Find Dotfiles',
					key = 'f',
					keymap = 'SPC f d',
					action = 'lua print(3)'
				},
				{
					icon = ' ',
					icon_hl = 'Title',
					desc = 'FILES',
					desc_hl = 'String',
				},
				{
					desc = '\t Search Git files',
					key = 'c',
					keymap = 'SPC g f',
					key_hl = 'Number',
					action = ':Telescope git_files'
				},
				{
					desc = '\t Search pwd',
					key = 'c',
					keymap = 'SPC g f',
					key_hl = 'Number',
					action = ':Telescope find_files'
				},
			},
			footer = {
				"\"I write, erase, rewrite",
				"Erase again, and then",
				"A poppy blooms.\"",
				"",
				"-- Katsushika Hokusai"
			}  --your footer
		}
	})


-- {
-- 				" _______________________________ ",
-- 				"/\\                              \\ ",
-- 				"/++\\    __________________________\\ ",
-- 				"\\+++\\   \\ ************************/ ",
-- 				"\\+++\\   \\___________________ ***/ ",
-- 				" \\+++\\   \\             /+++/***/ ",
-- 				"\\+++\\   \\           /+++/***/ ",
-- 				"\\+++\\   \\         /+++/***/ ",
-- 				"\\+++\\   \\       /+++/***/ ",
-- 				"\\+++\\   \\     /+++/***/ ",
-- 				"\\+++\\   \\   /+++/***/ ",
-- 				"\\+++\\   \\ /+++/***/ ",
-- 				"\\+++\\   /+++/***/ ",
-- 				"\\+++\\ /+++/***/ ",
-- 				"\\+++++++/***/ ",
-- 				"\\+++++/***/ ",
-- 				" \\+++/***/ ",
-- 				" \\+/___/ ",
-- 				"",
-- 				"",
-- 			},
--

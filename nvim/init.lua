
--      ___________ - Written By Julian Insua
--     /__  __  __/ - Stolen from many others
--       / / / /    - File: init.lua
--  __  / / / /     - Date: 11/11/2022
-- / /_/ /_/ /__    - Comments: 104 years ago WWI ended
-- \____/______/    -

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.mouse = 'a'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ruler = true
vim.opt.showmatch = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes:2"
vim.opt.termguicolors = true
vim.opt.scrolloff = 4
-- vim.cmd('syntax on')

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
  Plug 'kassio/neoterm'                                   --Get a terminal working inside vim
  Plug 'nvim-lualine/lualine.nvim'                      -- This is the status bar
  Plug 'kyazdani42/nvim-web-devicons'                   -- Icons for the statusbar
  Plug 'gruvbox-community/gruvbox'                      -- This is the Gruvbox colortheme for vim 
--  Plug 'https://github.com/preservim/nerdtree'          -- This is the file navigator
  Plug 'nvim-tree/nvim-tree.lua'                        -- This is the file navigator
  Plug 'Xuyuanp/nerdtree-git-plugin'                    -- This gives you git status on nerdtree
  Plug 'lewis6991/gitsigns.nvim'                        -- This gives you some signs on the gutter that indicate what's new and what was moddified, etc in the file
  Plug 'tpope/vim-fugitive'                             -- This allows you to do git stuff from within vim
  Plug 'ap/vim-css-color'                               -- This previews hex colors on css
  Plug 'ryanoasis/vim-devicons'                         -- This are the development icons
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'        -- This enhances the appearance of vim nerd tree and devicons
  Plug ('mg979/vim-visual-multi', {branch = 'master'})  -- This allows for multiple cursors 
  Plug 'sheerun/vim-polyglot'                           -- This allows higlighting for almost every language out there
  Plug 'jiangmiao/auto-pairs'                           -- This autocloses most surrounders
  Plug 'alvan/vim-closetag'                             -- This autocloses HTML tags
  Plug 'tpope/vim-surround'                             -- Allows surrounding selected text and other surrounding actions
  Plug('neoclide/coc.nvim', {branch = 'release'})      -- This allows autocompletion 
  Plug 'tpope/vim-commentary'                           -- This allows commenting lines of code with shortcuts
  Plug 'yggdroot/indentline'                            -- This shows a line for each indentation
  Plug 'junegunn/fzf'                                   -- This is the fuzzy find algorithm
  Plug 'junegunn/fzf.vim'                               -- This is the adapter for vim of the fuzzy find algorithm
  Plug 'puremourning/vimspector'                        -- This is the debugger for vim
  Plug 'andymass/vim-matchup'                           -- This extends the functionality of % to code elements and tags
vim.call('plug#end')

vim.g.mapleader = ' '

vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_transparent_bg = '1'
vim.cmd('colorscheme gruvbox')

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {'NvimTree'},
      tabline = {'NvimTree'},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
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


-- Go to file, if it doesnt exist create it
vim.keymap.set('', 'gf', ':edit <cfile><CR>')

-- Navigate split buffers using Space h,l close with Space Q
vim.keymap.set('n', '<leader>l', ':bnext<CR>', {silent = true})
vim.keymap.set('n', '<leader>h', ':bprevious<CR>', {silent = true})
vim.keymap.set('n', '<leader>Q', ':bdelete!<CR>', {silent = true})

-- Save all with Ctrl+s
vim.keymap.set('n', '<C-s>', ':wa<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:wa<CR>')

-- Navigate splits using Ctrl+h,j,k,l
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')

-- Resize splits with Alt+h,j,k,l
vim.keymap.set('n', '<M-h>', '<C-w><lt>')
vim.keymap.set('n', '<M-j>', '<C-w>-')
vim.keymap.set('n', '<M-k>', '<C-w>+')
vim.keymap.set('n', '<M-l>', '<C-w>>')

--Nvimtree configuration
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Open Nvimtree with Ctrl+t
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')

-- empty setup using defaults
require("nvim-tree").setup()

-- Open fzf and search git tree files with Alt+g
vim.keymap.set('n', '<M-g>', ':Gfiles<CR>')

-- Open fzf and find files in home directory with Alt+.
vim.keymap.set('n', '<M-.>', ':Files ~/<CR>')

-- Open fzf and search lines inside the current buffer with Alt+f
vim.keymap.set('n', '<M-f>', ':Blines<CR>')

-- Open fzf with open buffers wit Alt+b
vim.keymap.set('n', '<M-b>', ':Buffers<CR>')

-- Search text within files usinf fzf and ripgrep (rg) with :F and shortcut to Alt+f
vim.g.rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always" -g "*.{js,ts,jsx,tsx,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,css,scss}" -g "!{.git,node_modules,vendor}/*" '

vim.api.nvim_create_user_command('F', 'call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)', {bang=true, nargs='*'})

vim.keymap.set('n', '<M-F>', ':F<CR>')

-- Refactor rename sth using Space r n
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)')

-- Override go to definition (gd) to go to different files if needed
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', {silent=true})

-- Find other implementations of whatever you are standing on
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', {silent=true})

vim.g.vimspector_base_dir = '/home/julian/.config/nvim/plugged/vimspector'
vim.keymap.set('n', '<leader>da', ':call vimspector#Launch()<CR>')
vim.keymap.set('n', '<leader>dx', ':call vimspector#Reset()<CR>')
vim.keymap.set('n', '<S-k>', ':call vimspector#StepOut()<CR>')
vim.keymap.set('n', '<S-l>', ':call vimspector#StepInto()<CR>')
vim.keymap.set('n', '<S-j>', ':call vimspector#StepOver()<CR>')
vim.keymap.set('n', '<leader>d_', ':call vimspector#Restart()<CR>')
vim.keymap.set('n', '<leader>dn', ':call vimspector#Continue()<CR>')
vim.keymap.set('n', '<leader>drc', ':call vimspector#RunToCursor()<CR>')
vim.keymap.set('n', '<leader>dh', ':call vimspector#ToggleBreakpoint()<CR>')
vim.keymap.set('n', '<leader>de', ':call vimspector#ToggleConditionalBreakpoint()<CR>')
vim.keymap.set('n', '<leader>dX', ':call vimspector#ClearBreakpoint()<CR>')



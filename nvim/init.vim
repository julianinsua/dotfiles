"      ___________ - Written By Julian Insua
"     /__  __  __/ - Stolen from many others
"       / / / /    - File:init.vim
"  __  / / / /     - Date:
" / /_/ /_/ /__    - Comments:
" \____/______/    -

set number
set relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set mouse=a
set splitright
set splitbelow
syntax on
set ruler
set showmatch
set hidden
set ignorecase
set smartcase
set signcolumn=yes:2
set termguicolors
set scrolloff=4
filetype on

call plug#begin("~/.config/nvim/plugged")
  Plug 'kassio/neoterm'                               " Get a terminal working inside vim
  Plug 'https://github.com/vim-airline/vim-airline'   " This is the status bar
  Plug 'vim-airline/vim-airline-themes'               " This is the statusbar theme
  Plug 'gruvbox-community/gruvbox'                     " This is the Gruvbox colortheme for vim 
  Plug 'https://github.com/preservim/nerdtree'        " This is the file navigator
  Plug 'Xuyuanp/nerdtree-git-plugin'                  " This gives you git status on nerdtree
"  Plug 'airblade/vim-gitgutter'                       " This gives you some signs on the gutter that indicate what's new and what was moddified, etc in the file
  Plug 'lewis6991/gitsigns.nvim'                      " This gives you some signs on the gutter that indicate what's new and what was moddified, etc in the file
  Plug 'tpope/vim-fugitive'                           " This allows you to do git stuff from within vim
  Plug 'ap/vim-css-color'                             " This previews hex colors on css
  Plug 'ryanoasis/vim-devicons'                       " This are the development icons
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      " This enhances the appearance of vim nerd tree and devicons
  Plug 'mg979/vim-visual-multi', {'branch': 'master'} " This allows for multiple cursors 
  Plug 'sheerun/vim-polyglot'                         " This allows higlighting for almost every language out there
  Plug 'jiangmiao/auto-pairs'                         " This autocloses most surrounders
  Plug 'alvan/vim-closetag'                           " This autocloses HTML tags
  Plug 'tpope/vim-surround'                           " Allows surrounding selected text and other surrounding actions
  Plug 'neoclide/coc.nvim', {'branch': 'release'}     " This allows autocompletion 
  Plug 'tpope/vim-commentary'                         " This allows commenting lines of code with shortcuts
  Plug 'yggdroot/indentline'                          " This shows a line for each indentation
  Plug 'junegunn/fzf'                                 " This is the fuzzy find algorithm
  Plug 'junegunn/fzf.vim'                             " This is the adapter for vim of the fuzzy find algorithm
  Plug 'puremourning/vimspector'                      " This is the debugger for vim
  Plug 'andymass/vim-matchup'                         " This extends the functionality of % to code elements and tags
call plug#end()

let g:airline_theme='gruvbox'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_transparent_bg = '1'
colorscheme gruvbox
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let mapleader = " "
" Go to file, if it doesnt exist create it
map gf :edit <cfile><CR>

" Navigate through tabs using space Tab and space l,h. Close with Space Q
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <silent> <leader>h :bprevious<CR>
nnoremap <silent> <leader>Q :bdelete!<CR>

" Insert new lines above or below and returns to line in normal mode using Space+o and Space+O
nnoremap <leader>o o<Esc>k
nnoremap <leader>O O<Esc>j

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
imap <C-s> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" Create the :Prettier command to format a file
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Hook the Prettier command before save (the coc-settings is not working for
" me)
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.json,*.css,*.scss :Prettier

" Save all with Ctrl+s
nnoremap <C-s> :wa<CR>
inoremap <C-s> <Esc>:wa<CR>

" Navigation between splits is Ctrl+h,j,k,l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resizeing splits with Alt+h,j,k,l
nnoremap <M-h> <C-W><lt>
nnoremap <M-j> <C-W>-
nnoremap <M-k> <C-W>+
nnoremap <M-l> <C-W>>

" Open nerd tree with Ctrl+t
nnoremap <C-t> :NERDTreeToggle<CR>

" Open fzf git files search with Alt+g
nnoremap <M-g> :GFiles<CR>

" Open fzf files search with Alt+.
nnoremap <M-.> :Files ~/<CR>

" Open fzf and search inside the current buffer
nnoremap <M-f> :BLines<CR>

" Open fzf buffers
nnoremap <M-b> :Buffers<CR>

" Search text within files using fzf and ripgrep (rg) with :F
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,ts,jsx,tsx,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,css,scss}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" Shortcut the search within files to Alt+Shift+f
nnoremap <M-F> :F<CR>

" Refactor-Rename something with Space r n
nnoremap <leader>rn <Plug>(coc-rename)

" Overrides the default gd mapping to go to different files if needed
nmap <silent> gd <Plug>(coc-definition)

" Finds other implementations of whatever you are standing on
nnoremap <silent> gi <Plug>(coc-implementation)

" Vimspector debuging mappings
let g:vimspector_base_dir='/home/julian/.config/nvim/plugged/vimspector'
nnoremap <leader>da :call vimspector#Launch()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
nnoremap <S-k> :call vimspector#StepOut()<CR>
nnoremap <S-l> :call vimspector#StepInto()<CR>
nnoremap <S-j> :call vimspector#StepOver()<CR>
nnoremap <leader>d_ :call vimspector#Restart()<CR>
nnoremap <leader>dn :call vimspector#Continue()<CR>
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>

" use <CR> to select an coc autocomplete option
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" <CR> automatically selects the first option and completes
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"


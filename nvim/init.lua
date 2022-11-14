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
Plug 'kassio/neoterm' --Get a terminal working inside vim (not using it, investigate and decide)
Plug 'nvim-lualine/lualine.nvim' -- This is the status bar
Plug 'kyazdani42/nvim-web-devicons' -- Icons for the statusbar
Plug 'gruvbox-community/gruvbox' -- This is the Gruvbox colortheme for vim
Plug 'nvim-tree/nvim-tree.lua' -- This is the file navigator
Plug 'lewis6991/gitsigns.nvim' -- This gives you some signs on the gutter that indicate what's new and what was moddified, etc in the file
Plug 'tpope/vim-fugitive' -- This allows you to do git stuff from within vim
Plug 'ap/vim-css-color' -- This previews hex colors on css
Plug 'ryanoasis/vim-devicons' -- This are the development icons
--Plug 'tiagofumo/vim-nerdtree-syntax-highlight' -- This enhances the appearance of vim nerd tree and devicons
Plug('mg979/vim-visual-multi', { branch = 'master' }) -- This allows for multiple cursors
Plug 'sheerun/vim-polyglot' -- This allows higlighting for almost every language out there
Plug 'jiangmiao/auto-pairs' -- This autocloses most surrounders
Plug 'alvan/vim-closetag' -- This autocloses HTML tags
Plug 'tpope/vim-surround' -- Allows surrounding selected text and other surrounding actions
--Plug('neoclide/coc.nvim', {branch = 'release'})      -- This allows autocompletion
Plug 'neovim/nvim-lspconfig' -- This allows easier configuration for the language server protocol (LSP)
Plug 'hrsh7th/nvim-cmp' -- This provides autocompletion using native LSP
Plug 'hrsh7th/cmp-nvim-lsp' -- This provides autocompletion using native LSP
Plug 'hrsh7th/cmp-buffer' -- This provides autocompletion using native LSP
Plug 'hrsh7th/cmp-path' -- This provides autocompletion using native LSP
Plug 'hrsh7th/cmp-vsnip' -- This is snippet support for nvim-cmp
Plug 'hrsh7th/vim-vsnip' -- This is the snippet engine
Plug 'jose-elias-alvarez/null-ls.nvim' --Gives the LSP support for third party formatters like prettier
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' }) -- This is a nice dialog window that can do many nice things. We CAN have nice stuff you know.
Plug 'nvim-lua/plenary.nvim' -- This is a required dependency of telescope.
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' }) -- This allows Telescope to use the fzf algorithm
Plug 'tpope/vim-commentary' -- This allows commenting lines of code with shortcuts
Plug 'yggdroot/indentline' -- This shows a line for each indentation
-- Plug 'junegunn/fzf' -- This is the fuzzy find algorithm
-- Plug 'junegunn/fzf.vim' -- This is the adapter for vim of the fuzzy find algorithm
Plug 'puremourning/vimspector' -- This is the debugger for vim
Plug 'andymass/vim-matchup' -- This extends the functionality of % to code elements and tags
vim.call('plug#end')

vim.g.mapleader = ' '

vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_transparent_bg = '1'
vim.cmd('colorscheme gruvbox')

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { 'NvimTree' },
      tabline = { 'NvimTree' },
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
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
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
    lualine_z = { 'tabs' }
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Configuration for GitSigns
require('gitsigns').setup {
  signs                        = {
    add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    untracked    = { hl = 'GitSignsAdd', text = '┆', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
  },
  signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                 = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked          = true,
  current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil, -- Use default
  max_file_length              = 40000, -- Disable if file is longer than this (in lines)
  preview_config               = {
    -- Options passed to nvim_open_win
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
-- LSP Configuration for different languages
local create_lsp_bindings = function()
  vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { buffer = 0 }) -- This one is more for statically typed languages
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set('n', '<leader>ej', vim.diagnostic.goto_next, { buffer = 0 })
  vim.keymap.set('n', '<leader>ek', vim.diagnostic.goto_prev, { buffer = 0 })
  vim.keymap.set('n', '<leader>el', ':Telescope diagnostics', { buffer = 0 }) --Lists all errors and lets you navigate the list with telescope
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = 0 }) --Lets you do stuff automatically like importing sth or organizing imports
end

local set_lsp_formatting = function(client, bufnr)
  -- if client.name == 'tsserver' then
  --   client.resolved_capabilities.document_formatting = false
  --   vim.api.nvim_create_autocmd('BufWritePre', {
  --     group = vim.api.nvim_create_augroup('Format', { clear = true }),
  --     buffer = bufnr,
  --     callback = function() vim.lsp.buf.format() end
  --   })
  -- end
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('Format', { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
        print('Format applied')
      end
    })
  end
end

require('null-ls').setup({
  sources = {
    require('null-ls').builtins.formatting.prettier,
    require('null-ls').builtins.formatting.eslint,
  }
})

-- PYTHON
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').pyright.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    print('pyright LSP attached')
    create_lsp_bindings()
    set_lsp_formatting(client, bufnr)
  end,
}

-- TYPESCRIPT
require('lspconfig').tsserver.setup {
  capabilities = capabilities,
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact', 'javascript.jsx' },
  cmd = { 'typescript-language-server', '--stdio' },
  on_attach = function(client, bufnr)
    print('Typescript LSP attached')
    create_lsp_bindings()
    set_lsp_formatting(client, bufnr)
  end,
}

-- LUA
require('lspconfig').sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    print('LUA LSP attached')
    create_lsp_bindings()
    set_lsp_formatting(client, bufnr)
  end,
}


-- Configure nvim-cmp to work with lsp for autocompletion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Go to file, if it doesnt exist create it
vim.keymap.set('', 'gf', ':edit <cfile><CR>')

-- Navigate split buffers using Space h,l close with Space Q
vim.keymap.set('n', '<leader>l', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<leader>h', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', '<leader>Q', ':bdelete!<CR>', { silent = true })

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

-- Open Nvimtree with Space t
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')

-- empty setup using defaults
require("nvim-tree").setup()

-- Telescope configuration
require('telescope').setup {
  defaults = {
    prompt_prefix = ' '
  }
}
require('telescope').load_extension('fzf')
local builtin = require('telescope.builtin')
-- Open Telescope and search git tree files with Alt+g
vim.keymap.set('n', '<leader>fg', builtin.git_files)

-- Open Telescope and find files in home directory with Alt+.
vim.keymap.set('n', '<leader>ff', builtin.find_files)

-- Open Telescope and search lines inside the current buffer with Alt+f
vim.keymap.set('n', '<leader>fl', builtin.current_buffer_fuzzy_find)

-- Open Telescope with open buffers wit Alt+b
vim.keymap.set('n', '<leader>fb', builtin.buffers)

-- Search text within files usinf fzf and ripgrep (rg) with :F and shortcut to Alt+f
vim.keymap.set('n', '<leader>fL', builtin.live_grep)
--vim.g.rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always" -g "*.{js,ts,jsx,tsx,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,css,scss}" -g "!{.git,node_modules,vendor}/*" '

--vim.api.nvim_create_user_command('F', 'call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)',
--{ bang = true, nargs = '*' })

-- vim.keymap.set('n', '<M-F>', ':F<CR>')

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
-- go to file, if it doesn't exist create it
vim.keymap.set('', 'gf', ':edit <cfile><cr>')

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- navigate split buffers using space n,N close with space x
vim.keymap.set('n', '<leader>n', ':bnext<cr>', { silent = true })
vim.keymap.set('n', '<leader>N', ':bprevious<cr>', { silent = true })
vim.keymap.set('n', '<leader>x', ':bdelete!<cr>', { silent = true, noremap = true })

-- save all with space+w in normal mode and Ctrl+s in insert mode
vim.keymap.set('n', '<leader>w', ':wa<cr>')
vim.keymap.set('n', '<c-s>', '<esc>:wa<cr>')
vim.keymap.set('i', '<c-s>', '<esc>:wa<cr>')

--create splits with space v (vertical) and space V (horizontal)
vim.keymap.set('n', '<leader>v', '<C-w>v')
vim.keymap.set('n', '<leader>V', '<C-w>s')
vim.keymap.set('n', '<leader>q', ':x<cr>')

-- move splits arround with Ctrl+H,J,K,L
vim.keymap.set('n', '<leader>H', '<C-w>H', {noremap = true})
vim.keymap.set('n', '<leader>J', '<C-w>J', {noremap = true})
vim.keymap.set('n', '<leader>K', '<C-w>K', {noremap = true})
vim.keymap.set('n', '<leader>L', '<C-w>L', {noremap = true})

-- navigate splits using ctrl+h,j,k,l
vim.keymap.set('n', '<c-j>', '<c-w><c-j>')
vim.keymap.set('n', '<c-k>', '<c-w><c-k>')
vim.keymap.set('n', '<c-l>', '<c-w><c-l>')
vim.keymap.set('n', '<c-h>', '<c-w><c-h>')

-- resize splits with alt+h,j,k,l [normal mode]
vim.keymap.set('n', '<m-h>', '<c-w><lt>')
vim.keymap.set('n', '<m-j>', '<c-w>-')
vim.keymap.set('n', '<m-k>', '<c-w>+')
vim.keymap.set('n', '<m-l>', '<c-w>>')

-- move around with alt+h,j,k,l [insert mode]
vim.keymap.set('i', '<m-h>', '<left>')
vim.keymap.set('i', '<m-j>', '<down>')
vim.keymap.set('i', '<m-k>', '<up>')
vim.keymap.set('i', '<m-l>', '<right>')

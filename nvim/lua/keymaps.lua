-- go to file, if it doesnt exist create it
vim.keymap.set('', 'gf', ':edit <cfile><cr>')

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- navigate split buffers using space h,l close with space q
vim.keymap.set('n', '<leader>n', ':bnext<cr>', { silent = true })
vim.keymap.set('n', '<leader>N', ':bprevious<cr>', { silent = true })
vim.keymap.set('n', '<leader>x', ':bdelete!<cr>', { silent = true, noremap = true })

-- save all with ctrl+s
vim.keymap.set('n', '<c-s>', ':wa<cr>')
vim.keymap.set('i', '<c-s>', '<esc>:wa<cr>')

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

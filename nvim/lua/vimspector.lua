-- General configuration and keybindings for vimspector
vim.g.vimspector_base_dir = '/home/julian/.local/share/nvim/lazy/vimspector'
vim.keymap.set('n', '<leader>da', ':call vimspector#launch()<cr>')
vim.keymap.set('n', '<leader>dx', ':call vimspector#reset()<cr>')
vim.keymap.set('n', '<leader>dk', ':call vimspector#stepout()<cr>')
vim.keymap.set('n', '<leader>dl', ':call vimspector#stepinto()<cr>')
vim.keymap.set('n', '<leader>dj', ':call vimspector#stepover()<cr>')
vim.keymap.set('n', '<leader>d_', ':call vimspector#restart()<cr>')
vim.keymap.set('n', '<leader>dn', ':call vimspector#continue()<cr>')
vim.keymap.set('n', '<leader>drc', ':call vimspector#runtocursor()<cr>')
vim.keymap.set('n', '<leader>dh', ':call vimspector#togglebreakpoint()<cr>')
vim.keymap.set('n', '<leader>de', ':call vimspector#toggleconditionalbreakpoint()<cr>')
vim.keymap.set('n', '<leader>dx', ':call vimspector#clearbreakpoints()<cr>')


vim.g.mapleader = " "

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- NvimTree
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>')


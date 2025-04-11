
vim.g.mapleader = " "

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- NvimTree
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '<leader>t+', ':NvimTreeResize +5<CR>')
vim.keymap.set('n', '<leader>t-', ':NvimTreeResize -5<CR>')


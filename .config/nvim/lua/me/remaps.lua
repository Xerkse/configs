-- Map <leader> to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>o', "o<Esc>")
vim.keymap.set('n', '<leader>O', "O<Esc>")


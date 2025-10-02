--REMAPS
--[[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

--hit escape to stop highlighting searches
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- remap scroll and shift scroll to 
vim.keymap.set("n", "<ScrollWheelUp>", "<C-Y>", { noremap = true, silent = true })
vim.keymap.set("n", "<ScrollWheelDown>", "<C-E>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-ScrollWheelUp>", "<PageUp>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-ScrollWheelDown>", "<PageDown>", { noremap = true, silent = true })


-- remap j and k to move with linewraps
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--add command for newline and no insert
-- Now this is [<Space> and ]<Space>
-- vim.keymap.set("n", "<leader>o", "o<Esc>")
-- vim.keymap.set("n", "<leader>O", "O<Esc>")

vim.keymap.set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Diagnostic keymaps
-- Now inclueded by defualt
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
--
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- cluster, so navigating tabs is quite easy this way.
vim.keymap.set("n", "<left>", "gT")
vim.keymap.set("n", "<right>", "gt")

-- Ctrl backspace added <C-BS> maps to <C-H> for reasons you can check with
-- Ctrl+v in insert mode
vim.keymap.set('i', '<C-H>', '<C-w>')
-- vim.keymap.set('i', '<C-BS>', '<C-[>')

--
-- vim.keymap.set("n", "<leader><C-W>t", funct

-- compile keymaps
vim.keymap.set("n", "<leader><F12>", ":w!<CR>:!compiler %<CR>", { desc = "Compile show" })
vim.keymap.set("n", "<F12>", ':w!<CR>:silent exec "!compiler %"<CR>', { desc = "Compile silent" })

-- run keymaps
vim.keymap.set("n", "<leader>r", ":!./%<CR>", { desc = "Run Current File" })


-- run keymap
vim.keymap.set("n", "<leader><Enter>", ":!./%<CR>", { desc = "Run Current File" })


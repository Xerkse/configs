-- GENERAL
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.guicursor = ""

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- sets textwidth
vim.opt.textwidth = 80
-- Don't show the mode, since it's already in status line Don't show the mode, since it's already in status line Don't show the mode, since it's already in status line Don't show the mode, since it's already in status line Don't show the mode, since it's already in status line
--
-- enable mouse mode
vim.opt.mouse = "a"

-- prompt on exit instead of erroring when files are unvisited
vim.o.confirm = true
-- Syjonc oclipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

--make relativenumbers on the left bar
vim.opt.number = true
vim.opt.relativenumber = true
--Allow for better colors, used by colorizer
vim.opt.termguicolors = true

-- new linewraps no longer go to the far left
vim.opt.breakindent = true
-- vim.opt.wrap = true

-- make tabs 4 width
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- do not make tabs into spaces
vim.opt.expandtab = false

--indenting things
vim.opt.autoindent = true
vim.opt.smartindent = true

--do not allow cursor to get close to top or bottom of screen
vim.opt.scrolloff = 8

--save undo history
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default(its that bar at the left next to the numbers where lsp things go. Helps make screen not shift around like it was)
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- add nrformat letters to autoincrement numners, letters, hex, otcal
vim.opt.nrformats = { "alpha", "hex", "bin" }

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Highlight the region on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- old, can be removed if works
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   group = num_au,
--   callback = function()
--     vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
--   end,
-- })

--REMAPS
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- remap j and k to
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
--
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- compile keymaps
vim.keymap.set("n", "<leader><F12>", ":w!<CR>:!compiler %<CR>", { desc = "Compile show" })
vim.keymap.set("n", "<F12>", ':w!<CR>:silent exec "!compiler %"<CR>', { desc = "Compile silent" })

-- PLUGINS
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system ({
--     'git',
--     'clone',
--     '--filter=blob:none',
--     'https://github.com/folke/lazy.nvim.git',
--     '--branch=stable', -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
-- To check the current status of your plugins, run
--    :Lazy
-- this is a test this is a test this is a test this is a test this is a test this is a test
--  You can press `?` in this menu for help. Use `:q` to close the window
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.

require("lazy").setup({
	-- { import = "custom.plugins" },

	--NOTE: keeping these extra lines of code incase autoloading everyitng with no order ends up causing problems. I don't really know what else to do right now.
	--
	-- Keeping these extra lines of code incase autoloading everyitng with no order ends up causing problems. I don't really know what else to do right now.
	require("custom.plugins.theme"),
	require("custom.plugins.colorizer"),
	require("custom.plugins.git"),
	require("custom.plugins.which_key"),
	require("custom.plugins.fzf"),
	require("custom.plugins.lsp"),
	require("custom.plugins.autoformat"),
	require("custom.plugins.autocompletion"),
	require("custom.plugins.comments"),
	require("custom.plugins.mini"),
	require("custom.plugins.treesitter"),
	require("custom.plugins.debug"),
	require("custom.plugins.indent_line"),
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2

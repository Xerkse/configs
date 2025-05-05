-- GENERAL
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

-- old, can be removed if works
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   group = num_au,
--   callback = function()
--     vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
--   end,
-- })

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
-- vim.opt.updatetime = 250
-- vim.opt.timeoutlen = 300

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

-- Set highlight on search, but clear on pressing <Esc> in normal mode set in
-- keymaps
vim.opt.hlsearch = true

-- currecntly not working and don't know why. I sourcvim.keymap.vim.keymap.ed it manually and it works.
vim.opt_local.formatoptions:remove "o"

--WHY NO WORK??????
--vim.lsp.inlay_hint.enable()

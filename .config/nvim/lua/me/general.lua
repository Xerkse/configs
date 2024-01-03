-- GENERAL
vim.opt.guicursor = ""
-- enable mouse mode
vim.opt.mouse = "a"
--sync clipboard between nvim and OS
vim.opt.clipboard = "unnamedplus"
--make relativenumbers on the left bar
vim.opt.relativenumber = true
vim.opt.number = true 
--Allow for better colors, used by colorizer
vim.opt.termguicolors = true
-- new linewraps no longer go to the far left
vim.opt.breakindent = true
vim.opt.wrap = true
--make tabs 4 width
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- make tabs into spaces
vim.opt.expandtab = true
--indenting things
vim.opt.autoindent = true
vim.opt.smartindent = true
--highlight when searching
vim.opt.hlsearch = false
--do not allow cursor to get close to top or bottom of screen
vim.opt.scrolloff = 8
--save undo history
vim.opt.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Keep signcolumn on by default(its that bar at the left next to the numbers where lsp things go. Helps make screen not shift around like it was)
vim.wo.signcolumn = 'yes'
-- add nrformat letters to autoincrement numners, letters, hex, otcal
vim.opt.nrformats = {"alpha","hex","bin"}
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Highlight the region on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = num_au,
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
  end,
})


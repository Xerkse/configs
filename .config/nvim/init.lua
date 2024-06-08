-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "



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
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	}
end

---@diagnostic disable-next-line: undefined-field
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
	{ import = "custom.plugins" },

	--NOTE: keeping these extra lines of code incase autoloading everyitng with no order ends up causing problems. I don't really know what else to do right now.
	--
	-- require("custom.plugins.theme"),
	-- require("custom.plugins.colorizer"),
	-- require("custom.plugins.git"),
	-- require("custom.plugins.which_key"),
	-- require("custom.plugins.fzf"),
	-- require("custom.plugins.lsp"),
	-- require("custom.plugins.autoformat"),
	-- require("custom.plugins.autocompletion"),
	-- require("custom.plugins.comments"),
	-- require("custom.plugins.mini"),
	-- require("custom.plugins.treesitter"),
	-- require("custom.plugins.debug"),
	-- require("custom.plugins.indent_line"),
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2

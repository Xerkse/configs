vim.opt_local.formatoptions:remove "o"

-- local daniel_format = vim.api.nvim_create_augroup('DanielFormat', { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	group = daniel_format,
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.opt.formatoptions:remove "o"
-- 	end
-- })

-- could use BufEnter if needed later on, but this seems to work and should only
-- run when a buffer is first entered.
vim.api.nvim_create_autocmd("BufNew", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove "o"
	end,
})

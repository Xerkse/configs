local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set( "n", "grh", 
  function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end,
  {buffer = bufnr, desc = "inlay hints toggle rustaceanvim", silent = true }
)

vim.keymap.set(
  "n", 
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  { silent = true, buffer = bufnr }
)

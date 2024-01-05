  -- compile keymaps
  vim.keymap.set('n', '<leader><F12>',':w!<CR>:!compiler %<CR>', { desc = 'Compile show' })
  vim.keymap.set('n', '<F12>',':w!<CR>:silent exec "!compiler %"<CR>', { desc = 'Compile silent' })

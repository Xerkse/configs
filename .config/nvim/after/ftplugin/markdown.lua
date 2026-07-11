vim.keymap.set("n", "<leader>tm", function()
  require('render-markdown').toggle()
end, {buffer = 0, desc = "[t]oggle Render[M]arkdown"})

vim.keymap.set("n", "<leader>tp", function()
  require('render-markdown').preview()
end, {buffer = 0, desc = "[t]oggle RenderMarkdown [p]review"})

vim.opt.spell = true
vim.opt.linebreak = true

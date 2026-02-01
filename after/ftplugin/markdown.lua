-- Disable text concealment to show all syntax characters
vim.opt_local.conceallevel = 0

-- Toggle markdown rendering
vim.keymap.set('n', '<leader>tm', '<cmd>RenderMarkdown toggle<cr>', {
  buffer = true,
  desc = 'Toggle markdown render',
})

local grug_far = require 'grug-far'

grug_far.setup {
  vim.keymap.set({ 'n', 'x' }, '<leader>gr', grug_far.open, { desc = 'Grug replace' }),

  vim.keymap.set({ 'n', 'x' }, '<leader>ga', function()
    grug_far.open { engine = 'astgrep' }
  end, { desc = 'Grug AST' }),
}

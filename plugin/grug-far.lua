vim.pack.add {
  {
    src = 'https://github.com/MagicDuck/grug-far.nvim',
    version = vim.version.range('1.6.x'),
    name = 'grug-far'
  }
}

local grug_far = require 'grug-far'

grug_far.setup {
  vim.keymap.set({ 'n', 'x' }, '<leader>gr', grug_far.open, { desc = 'Grug replace' }),

  vim.keymap.set({ 'n', 'x' }, '<leader>ga', function()
    grug_far.open { engine = 'astgrep' }
  end, { desc = 'Grug AST' }),
}

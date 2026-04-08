require('todo-comments').setup()
local which_key = require 'which-key'

which_key.setup {
  preset = 'helix',
  spec = {
    { '<leader>h', group = 'Git Hunk' },
    { '<leader>s', group = 'Search' },
    { '<leader>t', group = 'Toggle' },
    { '<leader>x', group = 'Diagnostics' },
  },
}

vim.keymap.set('n', '<leader>?', function()
  which_key.show { global = false }
end, { desc = 'Buffer Local Keymaps (which-key)' })

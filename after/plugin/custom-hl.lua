local custom_hl = require 'custom-hl'

custom_hl.setup {
  transparent = true,
}

vim.keymap.set('n', '<leader>tt', custom_hl.toggle_transparency, { desc = 'Toggle Transparency' })

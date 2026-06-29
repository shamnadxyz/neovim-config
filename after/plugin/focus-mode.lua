local focus = require 'focus-mode'

vim.keymap.set('n', '<leader>tf', focus.toggle_focus_mode, { desc = 'Toggle focus mode' })

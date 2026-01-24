-- Leader Key Setup
-- Set space as the global leader key (primary shortcut prefix)
vim.g.mapleader = ' '

-- Set space as the local leader key (buffer-specific shortcuts)
vim.g.maplocalleader = ' '

-- Return to/from Explorer
-- vim.keymap.set('n', '<leader>e', function()
--   if vim.bo.filetype == 'netrw' then
--     pcall(vim.cmd('Rexplore'))
--   else
--     vim.cmd('Explore')
--   end
-- end, { desc = "Toggle explorer" })

-- Center cursor when scrolling half-page
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Center cursor when searching (n/N)
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Clipboard Management
-- Paste without yanking (avoid overwriting register)
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Replace selection without affecting clipboard' })

-- Yank to system clipboard (all modes)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank whole line to system clipboard' })

-- Delete without yanking (silent delete)
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without affecting clipboard' })

-- Clear search highlights when pressing Escape
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Open diagnostics in location list
vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, { desc = 'Open diagnostics in location list' })

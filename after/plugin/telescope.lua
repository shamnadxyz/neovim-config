local telescope = require 'telescope'
telescope.setup {
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
}

telescope.load_extension 'fzf'

local fzf = require 'telescope.builtin'

vim.keymap.set('n', '<leader>sf', fzf.find_files, { desc = 'Search files' })
vim.keymap.set('n', '<leader>sp', fzf.git_files, { desc = 'Search project git files' })
vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = 'Search by grep' })
vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = 'Search help' })
vim.keymap.set('n', '<leader>ss', fzf.builtin, { desc = 'Search builtin pickers' })
vim.keymap.set('n', '<leader>sd', fzf.diagnostics, { desc = 'Search diagnostics' })
vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = 'Resume search' })
vim.keymap.set('n', '<leader>so', fzf.oldfiles, { desc = 'Search old files' })
vim.keymap.set('n', '<leader>sb', fzf.buffers, { desc = 'Search buffers' })

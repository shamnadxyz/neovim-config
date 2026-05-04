local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local utils = require 'telescope.utils'

telescope.setup {
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
}

telescope.load_extension 'fzf'

local fd_find_args = {
  'fd',
  '-H',
  '-E',
  '**/.git',
}

local function project_files()
  builtin.find_files { find_command = fd_find_args }
end

local function buffer_dir_files()
  builtin.find_files {
    find_command = fd_find_args,
    cwd = utils.buffer_dir(),
  }
end

local function buffer_git_tracked()
  builtin.git_files { use_file_path = true }
end

vim.keymap.set('n', '<leader>sf', project_files, { desc = 'Search files' })
vim.keymap.set('n', '<leader>sF', buffer_dir_files, { desc = 'Search files in buffer dir' })
vim.keymap.set('n', '<leader>sp', builtin.git_files, { desc = 'Search git files (project)' })
vim.keymap.set('n', '<leader>sP', buffer_git_tracked, { desc = 'Search git files (buffer dir)' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search help tags' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search builtin pickers' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search diagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Resume last search' })
vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = 'Search recent files' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Search buffers' })

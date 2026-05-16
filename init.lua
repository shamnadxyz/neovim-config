-- NEOVIM CONFIG

-- KEYMAPS {{{
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>e', function()
  if vim.bo.filetype == 'netrw' then
    pcall(vim.cmd 'Rexplore')
  else
    vim.cmd 'Explore'
  end
end, { desc = 'Toggle explorer' })

-- Center cursor
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Replace selection without affecting clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank whole line to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without affecting clipboard' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })
vim.keymap.set('n', '<TAB>', 'za', { desc = 'Toggle Fold' })
-- }}}

-- OPTIONS {{{
vim.o.breakindent = true
vim.o.breakindentopt = 'list:-1'
vim.o.foldtext = ''
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.inccommand = 'split'
vim.o.incsearch = true
vim.o.linebreak = true
vim.o.mouse = ''
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.shiftwidth = 2
vim.o.sidescrolloff = 10
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.spelllang = 'en_us'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.wrap = false
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldenable = false
-- }}}

-- AUTOCOMMANDS {{{
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  desc = 'Check for file changes when gaining focus or leaving terminal',
  group = vim.api.nvim_create_augroup('checktime', { clear = true }),
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd 'checktime'
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'help',
    'qf',
    'notify',
    'lspinfo',
    'checkhealth',
    'man',
    'gitsigns-blame',
    'diff',
  },
  desc = 'Close temporary buffers with q',
  group = vim.api.nvim_create_augroup('close-with-q', { clear = true }),
  callback = function(event)
    vim.keymap.set('n', 'q', '<CMD>:q<CR>', { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd({ 'VimResized' }, {
  desc = 'resize splits if window got resized',
  group = vim.api.nvim_create_augroup('resize_splits', { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd 'tabdo wincmd ='
    vim.cmd('tabnext ' .. current_tab)
  end,
})

vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('pack-treesitter-update', { clear = true }),
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
    end
  end,
})
-- }}}

-- INSTALL PLUGINS {{{
vim.pack.add {
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range '1.x',
  },
  {
    src = 'https://github.com/stevearc/conform.nvim',
    version = vim.version.range '9.x',
  },
  {
    src = 'https://github.com/lewis6991/gitsigns.nvim',
    version = vim.version.range '2.x',
  },
  {
    src = 'https://github.com/MagicDuck/grug-far.nvim',
    version = vim.version.range '1.6.x',
  },
  {
    src = 'https://github.com/neovim/nvim-lspconfig',
  },
  {
    src = 'https://github.com/nvim-lua/plenary.nvim',
  },
  {
    src = 'https://github.com/sindrets/diffview.nvim',
  },
  {
    src = 'https://github.com/NeogitOrg/neogit',
  },
  {
    src = 'https://github.com/mfussenegger/nvim-lint',
  },
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main',
  },
  {
    src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  },
  {
    src = 'https://github.com/nvim-telescope/telescope.nvim',
    version = vim.version.range 'x',
  },
  {
    src = 'https://github.com/nvim-mini/mini.nvim',
    version = vim.version.range 'stable',
  },
}
vim.cmd ':packadd nvim.undotree'
-- }}}

-- Enable Experimental UI2
require('vim._core.ui2').enable()

vim.cmd.colorscheme("wallust")
require('custom-hl').setup { transparent = true }
-- vim:foldmethod=marker

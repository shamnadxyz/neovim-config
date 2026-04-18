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
    src = 'https://github.com/ibhagwan/fzf-lua',
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
}

vim.cmd ':packadd nvim.undotree'

vim.pack.add {
  {
    src = 'https://github.com/neovim/nvim-lspconfig',
  },
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main',
  },
  {
    src = 'https://github.com/nvim-mini/mini.nvim',
    version = vim.version.range 'stable',
  },
}

vim.cmd ':packadd nvim.undotree'

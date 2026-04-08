vim.api.nvim_create_autocmd('PackChanged', {
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

vim.pack.add {
  {
    src = 'https://github.com/saghen/blink.indent',
    version = vim.version.range '2.x',
  },
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range '1.x',
  },
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
  {
    src = 'https://github.com/stevearc/conform.nvim',
    version = vim.version.range '9.x',
  },
  {
    src = 'https://github.com/folke/todo-comments.nvim',
    version = 'stable',
  },
  {
    src = 'https://github.com/nvim-lua/plenary.nvim',
  },
  {
    src = 'https://github.com/folke/which-key.nvim',
    version = 'stable',
  },
  { src = 'https://github.com/ibhagwan/fzf-lua' },
  {
    src = 'https://github.com/lewis6991/gitsigns.nvim',
    version = vim.version.range '2.x',
  },
  {
    src = 'https://github.com/MagicDuck/grug-far.nvim',
    version = vim.version.range '1.6.x',
  },
  {
    src = 'https://github.com/j-hui/fidget.nvim',
    version = vim.version.range '1.6.x',
  },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nvim-mini/mini.nvim', version = 'stable' },
  { src = 'https://github.com/mfussenegger/nvim-lint' },
  {
    src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    version = vim.version.range '8.x',
  },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/sindrets/diffview.nvim' },
  { src = 'https://github.com/NeogitOrg/neogit' },
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main',
  },
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter-context',
  },
  {
    src = 'https://github.com/folke/trouble.nvim',
    version = vim.version.range '3.7.x',
  },
}

vim.cmd ':packadd nvim.undotree'

return {
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    keys = {
      { '<leader>e', '<cmd>Oil<cr>', desc = 'Open Oil File Explorer' },
    },
    lazy = false,
  },
}

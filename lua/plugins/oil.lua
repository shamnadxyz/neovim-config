return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<C-l>'] = false,
          ['<C-k>'] = false,
          ['<C-j>'] = false,
        },
        view_options = {
          show_hidden = true,
        },
      }

      vim.keymap.set('n', '<leader>e', '<CMD>Oil<CR>', { desc = 'Open Oil file explorer' })
    end,
  },
}

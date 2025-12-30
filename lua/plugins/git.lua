return {
  { -- Git signs
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gitsigns = require 'gitsigns'

          vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk_inline, { buffer = bufnr, desc = 'Hunk preview' })

          vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, { buffer = bufnr, desc = 'Stage hunk' })

          vim.keymap.set('n', '<leader>hb', function()
            gitsigns.blame { full = true }
          end, { buffer = bufnr, desc = 'Blame' })

          vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, { buffer = bufnr, desc = 'Diff current buffer' })

          vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = 'Toggle current line blame' })

          -- Text object
          vim.keymap.set({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { buffer = bufnr, desc = 'Select hunk' })
        end,
      }
    end,
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    cmd = 'Neogit',
    keys = {
      { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Neogit' },
      { '<leader>gs', '<cmd>Neogit cwd=%:p:h<cr>', desc = 'Neogit file' },
    },
  },
}

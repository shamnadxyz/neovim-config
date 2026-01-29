return {
  {
    'nvim-mini/mini.pick',
    version = '*',
    config = function()
      local pick = require("mini.pick")

      pick.setup({
        -- Keys for performing actions. See `:h MiniPick-actions`.
        mappings = {
          caret_left        = '<Left>',
          caret_right       = '<Right>',

          choose            = '<CR>',
          choose_in_split   = '<C-s>',
          choose_in_tabpage = '<C-t>',
          choose_in_vsplit  = '<C-v>',
          choose_marked     = '<C-CR>',

          delete_char       = '<BS>',
          delete_char_right = '<Del>',
          delete_left       = '<C-u>',
          delete_word       = '<C-w>',

          mark              = '<C-x>',
          mark_all          = '<C-a>',

          move_down         = '<C-n>',
          move_start        = '<C-g>',
          move_up           = '<C-p>',

          paste             = '<C-r>',

          refine            = '<C-Space>',
          refine_marked     = '<M-Space>',

          scroll_down       = '<C-f>',
          scroll_left       = '<C-h>',
          scroll_right      = '<C-l>',
          scroll_up         = '<C-b>',

          stop              = '<Esc>',

          toggle_info       = '<S-Tab>',
          toggle_preview    = '<Tab>',
        },
        source = {
          show = pick.default_show
        },
        window = {
          config = {
            border = 'rounded' }
        }
      })

      local project_files = function()
        pick.builtin.files({ tool = 'git' })
      end
      local search_files = function()
        pick.builtin.files({ tool = 'fd' })
      end

      vim.keymap.set('n', '<leader>sf', search_files, { desc = 'Search files' })
      vim.keymap.set('n', '<leader>sp', project_files, { desc = 'Search project git files' })
      vim.keymap.set('n', '<leader>sh', pick.builtin.help, { desc = 'Search help' })
      vim.keymap.set('n', '<leader>sg', pick.builtin.grep_live, { desc = 'Search by grep' })
      vim.keymap.set('n', '<leader>sb', pick.builtin.buffers, { desc = 'Search buffers' })
      vim.keymap.set('n', '<leader>sr', pick.builtin.resume, { desc = 'Search resume' })

      vim.api.nvim_set_hl(0, "MiniPickNormal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "MiniPickBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "MiniPickPrompt", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "MiniPickBorderText", { bg = "#2C2E33" })
    end
  }
}

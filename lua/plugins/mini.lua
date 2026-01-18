return {
  {
    'nvim-mini/mini.files',
    version = '*',
    config = function()
      local minifiles = require 'mini.files'
      minifiles.setup {

        -- Module mappings created only inside explorer.
        -- Use `''` (empty string) to not create one.
        mappings = {
          close = 'q',
          go_in = 'l',
          go_in_plus = 'L',
          go_out = 'h',
          go_out_plus = 'H',
          mark_goto = "'",
          mark_set = 'm',
          reset = '<BS>',
          reveal_cwd = '@',
          show_help = 'g?',
          synchronize = '=',
          trim_left = '<',
          trim_right = '>',
        },

        -- General options
        options = {
          -- Whether to delete permanently or move into module-specific trash
          permanent_delete = false,
          -- Whether to use for editing directories
          use_as_default_explorer = true,
        },

        -- Customization of explorer windows
        windows = {
          -- Maximum number of windows to show side by side
          max_number = math.huge,
          -- Whether to show preview of file/directory under cursor
          preview = true,
          -- Width of focused window
          width_focus = 30,
          -- Width of non-focused window
          width_nofocus = 30,
          -- Width of preview window
          width_preview = 80,
        },
      }

      vim.keymap.set('n', '<leader>e', function()
        if not minifiles.close() then
          minifiles.open()
        end
      end, { desc = 'Open Oil file explorer' })
    end,
  },
}

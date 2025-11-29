return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    local transparency = true
    local catppuccin = require 'catppuccin'

    catppuccin.setup {
      transparent_background = transparency,
    }

    -- Function to toggle transparency
    local function toggle_transparency()
      transparency = not transparency
      catppuccin.setup {
        transparent_background = transparency,
      }
      vim.cmd.colorscheme 'catppuccin'
    end

    vim.keymap.set('n', '<leader>t', toggle_transparency, {
      noremap = true,
      silent = true,
      desc = 'Toggle transparency',
    })

    vim.cmd.colorscheme 'catppuccin'
  end,
}

return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      local catppuccin = require 'catppuccin'
      local opts = {
        auto_integrations = true,
        transparent_background = true,
        float = {
          transparent = true,
          solid = true,
        },
      }

      -- Initial setup
      catppuccin.setup(opts)

      -- Toggle transparency
      local function toggle_transparency()
        opts.transparent_background = not opts.transparent_background
        catppuccin.setup(opts)
        vim.cmd.colorscheme 'catppuccin'
      end

      vim.keymap.set('n', '<leader>tt', toggle_transparency, {
        noremap = true,
        silent = true,
        desc = 'Toggle transparency',
      })

      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}

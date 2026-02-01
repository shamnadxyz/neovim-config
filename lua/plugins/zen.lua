return {
  {
    "folke/zen-mode.nvim",
    keys = {
      { '<leader>tz', '<cmd>ZenMode<cr>', desc = 'Toggle ZenMode' },
    },
    opts = {
      window = {
        backdrop = 0.85,
        width = 100,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
          cmdheight = 0
        }
      }
    }
  }
}

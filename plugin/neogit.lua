vim.pack.add {
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/NeogitOrg/neogit",
}

local neogit = require 'neogit'

neogit.setup()

vim.keymap.set('n', "<leader>gs", "<cmd>Neogit<cr>", { desc = "Show Neogit UI" })

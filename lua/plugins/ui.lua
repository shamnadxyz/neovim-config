return {
  { "numToStr/Comment.nvim", opts = {} }, -- Commenting
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    keys = {
      { "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil File Explorer" },
    },
    lazy = false,
  },
  { "nvim-mini/mini.statusline", version = "*", opts = {} },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}

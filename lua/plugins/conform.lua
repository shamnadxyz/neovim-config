return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          sh = { "shellharden" },
          -- Conform will run multiple formatters sequentially
          python = { "ruff_format" },
          -- You can customize some of the format options for the filetype (:help conform.format)
          rust = { "rustfmt", lsp_format = "fallback" },
          -- Conform will run the first available formatter
          javascript = { "prettierd", "prettier", stop_after_first = true },
        },
        -- Default formatting options
        default_format_opts = {
          timeout_ms = 3000,
          async = false,
          quiet = false,
          lsp_format = "fallback",
        },

        -- Custom formatter configuration (optional)
        formatters = {
          injected = {
            options = {
              ignore_errors = true,
            },
          },
          -- Example:
          -- shfmt = {
          --   prepend_args = { "-i", "2", "-ci" },
          -- },
        },
      })
    end,
  },
}

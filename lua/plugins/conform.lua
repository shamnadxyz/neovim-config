return {
  {
    'stevearc/conform.nvim',
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    config = function()
      require('conform').setup {
        -- Conform will run multiple formatters sequentially
        -- You can customize some of the format options for the filetype (:help conform.format)
        -- Conform will run the first available formatter
        formatters_by_ft = {
          c = { 'clang_format' },
          cpp = { 'clang_format' },
          javascript = { 'biome', 'biome-organize-imports' },
          javascriptreact = { 'biome', 'biome-organize-imports' },
          lua = { 'stylua' },
          markdown = { 'markdownlint' },
          python = { 'ruff_format', 'ruff_organize_imports' },
          rust = { 'rustfmt', lsp_format = 'fallback' },
          sh = { 'shfmt' },
          bash = { 'shfmt' },
          typescript = { 'biome', 'biome-organize-imports' },
          typescriptreact = { 'biome', 'biome-organize-imports' },
          sql = { 'pg_format' },
        },
        -- Default formatting options
        default_format_opts = {
          timeout_ms = 3000,
          async = false,
          quiet = false,
          lsp_format = 'fallback',
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
      }
    end,
  },
}

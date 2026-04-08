local conform = require 'conform'

conform.setup {
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
  default_format_opts = {
    timeout_ms = 3000,
    async = false,
    quiet = false,
    lsp_format = 'fallback',
  },

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

local function format()
  conform.format { async = true, lsp_format = 'fallback' }
end

vim.keymap.set('n', '<leader>f', format, { desc = 'Format buffer' })

local conform = require 'conform'

conform.setup {
  formatters_by_ft = {
    bash = { 'shfmt' },
    c = { 'clang_format' },
    cpp = { 'clang_format' },
    javascript = { 'biome', 'biome-organize-imports' },
    javascriptreact = { 'biome', 'biome-organize-imports' },
    lua = { 'stylua' },
    markdown = { 'markdownlint' },
    python = { 'ruff_format', 'ruff_organize_imports' },
    rust = { 'rustfmt', lsp_format = 'fallback' },
    sh = { 'shfmt' },
    sql = { 'pg_format' },
    typescript = { 'biome', 'biome-organize-imports' },
    typescriptreact = { 'biome', 'biome-organize-imports' },
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
  },
}

local function format()
  conform.format { async = true, lsp_format = 'fallback' }
end

vim.keymap.set('n', '<leader>f', format, { desc = 'Format buffer' })

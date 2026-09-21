local conform = require 'conform'

conform.setup {
  formatters_by_ft = {
    bash = { 'shfmt' },
    c = { 'clang_format' },
    cpp = { 'clang_format' },
    javascript = { 'biome', 'biome-organize-imports' },
    json = { 'biome' },
    javascriptreact = { 'biome', 'biome-organize-imports' },
    lua = { 'stylua' },
    -- markdown = { 'markdownlint' },
    nix = { 'nixfmt' },
    python = { 'ruff_format', 'ruff_organize_imports' },
    rust = { 'rustfmt', lsp_format = 'fallback' },
    sh = { 'shfmt' },
    sql = { 'pg_format' },
    typescript = { 'biome', 'biome-organize-imports' },
    typescriptreact = { 'biome', 'biome-organize-imports' },
  },

  default_format_opts = {
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

conform.formatters.shfmt = { append_args = { '--case-indent' } }

vim.keymap.set('n', '<leader>f', conform.format, { desc = 'Format buffer' })

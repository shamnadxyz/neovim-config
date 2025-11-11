return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      -- Keymap preset: 'default' (built-in-like), 'super-tab' (vscode-like), 'enter', or 'none'
      keymap = { preset = 'default' },
      appearance = {
        -- Nerd font variant: 'mono' (default) or 'normal'
        nerd_font_variant = 'mono',
      },
      completion = { documentation = { auto_show = false } },
      -- Default sources, extendable via opts_extend
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      -- Fuzzy matcher implementation: 'prefer_rust_with_warning' (default), 'lua', or 'prefer_rust'
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },
}

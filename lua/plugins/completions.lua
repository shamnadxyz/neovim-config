return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        nerd_font_variant = 'normal',
        use_nvim_cmp_as_default = true,
      },

      completion = {
        accept = { auto_brackets = { enabled = false } },
      },

      -- Default sources, extendable via opts_extend
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      cmdline = {
        keymap = {
          preset = 'inherit',
          ['<Tab>'] = { 'show', 'accept', 'fallback' },
        },
      },

      -- Use a preset for snippets, check the snippets documentation for more information
      snippets = { preset = 'default' },

      signature = { enabled = true, window = { show_documentation = false } },

      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = {
      'sources.default',
    },
  },
}

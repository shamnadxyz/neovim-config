return {
  {
    'saghen/blink.cmp',

    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },

    opts = {
      keymap = { preset = 'default' },

      appearance = {
        nerd_font_variant = 'normal',
        use_nvim_cmp_as_default = true,
      },

      completion = {
        accept = { auto_brackets = { enabled = false } },
        menu = {
          -- Don't automatically show the completion menu
          auto_show = function()
            return not vim.tbl_contains({ 'markdown' }, vim.bo.filetype)
          end,
        },
      },

      snippets = { preset = 'luasnip' },

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

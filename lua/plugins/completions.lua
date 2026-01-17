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
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        nerd_font_variant = 'mono',
      },

      completion = {
        accept = { auto_brackets = { enabled = false } },
        menu = {
          -- Don't automatically show the completion menu
          auto_show = function()
            return not vim.tbl_contains({ 'markdown' }, vim.bo.filetype)
          end,
          draw = {
            columns = {
              { 'kind_icon' },
              { 'label', 'label_description' },
              { 'kind' },
            },
          },
        },
        documentation = { auto_show = true },
        ghost_text = {
          enabled = true,
          -- Show the ghost text when an item has been selected
          show_with_selection = true,
          -- Show the ghost text when no item has been selected, defaulting to the first item
          show_without_selection = false,
          -- Show the ghost text when the menu is open
          show_with_menu = true,
          -- Show the ghost text when the menu is closed
          show_without_menu = false,
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

      signature = { enabled = true, window = { show_documentation = true } },


      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = {
      'sources.default',
    },
  },
}

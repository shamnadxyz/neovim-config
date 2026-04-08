local indent = require 'blink.indent'

indent.setup {
  static = {
    char = '▏',
    highlights = { 'BlinkIndent' },
  },
  scope = {
    char = '▏',
    highlights = { 'BlinkIndentScope' },
  },
}

local cmp = require 'blink.cmp'

cmp.setup {
  keymap = { preset = 'default' },

  appearance = {
    nerd_font_variant = 'mono',
  },

  completion = {
    accept = { auto_brackets = { enabled = false } },
    menu = {
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
      enabled = false,
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

  -- Default sources, extendable via opts_extend
  sources = {
    default = { 'lsp', 'path', 'snippets', 'dynamic', 'buffer' },
    providers = {
      dynamic = {
        name = 'Dynamic',
        module = 'dynamic',
        opts = {},
      },
    },
  },

  cmdline = {
    keymap = {
      preset = 'inherit',
      ['<Tab>'] = { 'show', 'accept', 'fallback' },
    },
  },

  signature = { enabled = true, window = { show_documentation = true } },

  -- Always prioritize exact matches
  fuzzy = {
    sorts = {
      'exact',
      -- defaults
      'score',
      'sort_text',
    },
    implementation = 'prefer_rust_with_warning',
  },
}

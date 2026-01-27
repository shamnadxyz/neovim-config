return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'saghen/blink.cmp',
    },

    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          -- Rename the variable under your cursor.
          vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { buffer = event.buf, desc = 'Rename' })

          vim.keymap.set({ 'n', 'x' }, 'gra', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'Goto code action' })

          -- Find references for the word under your cursor.
          vim.keymap.set('n', 'grr', vim.lsp.buf.references, { buffer = event.buf, desc = 'Goto references' })

          -- Jump to the implementation of the word under your cursor.
          vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, { buffer = event.buf, desc = 'Goto implementation' })

          -- Jump to the definition of the word under your cursor.
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = event.buf, desc = 'Goto definition' })

          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = 'Goto declaration' })

          -- Find all the symbols in your current document.
          vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol, { buffer = event.buf, desc = 'Open document symbols' })

          -- Find symbols in your current workspace.
          vim.keymap.set('n', 'gW', vim.lsp.buf.workspace_symbol, { buffer = event.buf, desc = 'Search workspace symbols' })

          -- Jump to the type of the word under your cursor.
          vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition, { buffer = event.buf, desc = 'Goto type definition' })

          local client = vim.lsp.get_client_by_id(event.data.client_id)

          -- Create a keymap to toggle inlay hints
          if client and client:supports_method 'textDocument/inlayHint' then
            vim.keymap.set('n', '<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }, { bufnr = event.buf })
            end, { buffer = event.buf, desc = 'Toggle inlay hints' })
          end
        end,
      })

      local servers = {
        bashls = {},
        biome = {},
        cssls = {},
        harper_ls = {},
        clangd = {},
        html = {},
        jsonls = {},
        markdown_oxide = {},
        postgres_lsp = {},
        pyright = {},
        ruff = {},
        rust_analyzer = {},
        svelte = {},
        tailwindcss = {},
        ts_ls = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { 'vim' } },
              runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
              workspace = {
                -- Don't analyze code from submodules
                ignoreSubmodules = true,
                -- Add Neovim's methods for easier code writing
                library = { vim.env.VIMRUNTIME },
                completion = {
                  callSnippet = 'Replace',
                },
              },
            },
          },
        },
      }

      for name, config in pairs(servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end

      -- Toggle virtual_text
      vim.keymap.set('n', '<leader>tv', function()
        local current = vim.diagnostic.config().virtual_text
        vim.diagnostic.config { virtual_text = not current }
      end, { desc = 'Toggle Virtual Text' })

      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = 'if_many',
          virt_text_pos = 'eol_right_align',
        },
      }
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location list (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix list (Trouble)',
      },
    },
  },
}

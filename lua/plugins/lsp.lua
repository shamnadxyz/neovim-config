return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },

    config = function()
      require('mason').setup()

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
            }
          end,
        },
      }

      -- LSP Keymaps with capability checking
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-keymaps', { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local buf = args.buf

          if not client then
            return
          end

          -- Navigation keymaps (essential)
          if client:supports_method 'textDocument/definition' then
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = buf, desc = 'Goto Definition' })
          end

          if client:supports_method 'textDocument/references' then
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = buf, desc = 'References', nowait = true })
          end

          if client:supports_method 'textDocument/implementation' then
            vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = buf, desc = 'Goto Implementation' })
          end

          if client:supports_method 'textDocument/typeDefinition' then
            vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = buf, desc = 'Goto Type Definition' })
          end

          if client:supports_method 'textDocument/declaration' then
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = buf, desc = 'Goto Declaration' })
          end

          -- Help & Information keymaps
          if client:supports_method 'textDocument/hover' then
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = buf, desc = 'Hover' })
          end

          if client:supports_method 'textDocument/signatureHelp' then
            vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { buffer = buf, desc = 'Signature Help' })
          end

          -- Code Actions
          if client:supports_method 'textDocument/codeAction' then
            vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = buf, desc = 'Code Action' })
          end

          if client:supports_method 'textDocument/rename' then
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = buf, desc = 'Rename' })
          end

          -- Optional: Document highlighting
          if client:supports_method 'textDocument/documentHighlight' then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
              end,
            })
          end
        end,
      })

      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        update_in_insert = false,
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'bashls',
        'biome',
        'cssls',
        'html',
        'jsonls',
        'lua_ls',
        'markdown_oxide',
        'markdownlint',
        'pgformatter',
        'postgres_lsp',
        'pyright',
        'ruff',
        'rust_analyzer',
        'shellcheck',
        'shellharden',
        'shfmt',
        'stylua',
        'svelte',
        'tailwindcss',
        'ts_ls',
      },
    },
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
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
}

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
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      {
        'j-hui/fidget.nvim',
        opts = {
          notification = {
            window = {
              winblend = 0,
            },
          },
        },
      },
      'saghen/blink.cmp',
    },

    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          -- Rename the variable under your cursor.
          vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { buffer = event.buf, desc = 'Rename' })

          vim.keymap.set({ 'n', 'x' }, 'gra', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'Goto Code Action' })

          -- Find references for the word under your cursor.
          vim.keymap.set('n', 'grr', require('telescope.builtin').lsp_references, { buffer = event.buf, desc = 'Goto References' })

          -- Jump to the implementation of the word under your cursor.
          vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, { buffer = event.buf, desc = 'Goto Implementation' })

          -- Jump to the definition of the word under your cursor.
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = event.buf, desc = 'Goto Definition' })

          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = 'Goto Declaration' })

          -- Fuzzy find all the symbols in your current document.
          vim.keymap.set('n', 'gO', require('telescope.builtin').lsp_document_symbols, { buffer = event.buf, desc = 'Open Document Symbols' })

          -- Fuzzy find all the symbols in your current workspace.
          vim.keymap.set('n', 'gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, { buffer = event.buf, desc = 'Open Workspace Symbols' })

          -- Jump to the type of the word under your cursor.
          vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition, { buffer = event.buf, desc = 'Goto Type Definition' })

          local client = vim.lsp.get_client_by_id(event.data.client_id)

          -- Create a keymap to toggle inlay hints
          if client and client:supports_method 'textDocument/inlayHint' then
            vim.keymap.set('n', '<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }, { bufnr = event.buf })
            end, { buffer = event.buf, desc = 'Toggle Inlay Hints' })
          end
        end,
      })

      local servers = {
        bashls = {},
        biome = {},
        cssls = {},
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
            checkThirdParty = false,
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = { library = { vim.env.VIMRUNTIME } },
              diagnostics = { globals = { 'vim' } },
            },
          },
        },
      }

      local ensure_installed = {
        'bash-language-server',
        'biome',
        'css-lsp',
        'html-lsp',
        'json-lsp',
        'lua-language-server',
        'markdown-oxide',
        'markdownlint',
        'pgformatter',
        'postgres-language-server',
        'pyright',
        'ruff',
        'rust-analyzer',
        'shellcheck',
        'shellharden',
        'shfmt',
        'stylua',
        'svelte-language-server',
        'tailwindcss-language-server',
        'typescript-language-server',
      }

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      for name, config in pairs(servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end

      local severity_icons = {
        [vim.diagnostic.severity.ERROR] = ' ',
        [vim.diagnostic.severity.WARN] = ' ',
        [vim.diagnostic.severity.INFO] = ' ',
        [vim.diagnostic.severity.HINT] = ' ',
      }

      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        update_in_insert = false,
        signs = vim.g.have_nerd_font and {
          text = severity_icons,
        } or {},
        virtual_text = {
          spacing = 4,
          source = 'if_many',
          prefix = function(diagnostic)
            return severity_icons[diagnostic.severity] or '●'
          end,
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

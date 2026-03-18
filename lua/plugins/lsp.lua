return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      { 'saghen/blink.cmp' },
      { 'ibhagwan/fzf-lua' },
    },

    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local fzf = require 'fzf-lua'

          vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { buffer = event.buf, desc = 'Rename' })
          vim.keymap.set({ 'n', 'x' }, 'gra', fzf.lsp_code_actions, { buffer = event.buf, desc = 'Code actions' })
          vim.keymap.set('n', 'grr', fzf.lsp_references, { buffer = event.buf, desc = 'References' })
          vim.keymap.set('n', 'gri', fzf.lsp_implementations, { buffer = event.buf, desc = 'Implementations' })
          vim.keymap.set('n', 'gd', fzf.lsp_definitions, { buffer = event.buf, desc = 'Definitions' })
          vim.keymap.set('n', 'gD', fzf.lsp_declarations, { buffer = event.buf, desc = 'Declarations' })
          vim.keymap.set('n', 'gO', fzf.lsp_document_symbols, { buffer = event.buf, desc = 'Document symbols' })
          vim.keymap.set('n', 'gW', fzf.lsp_workspace_symbols, { buffer = event.buf, desc = 'Workspace symbols' })
          vim.keymap.set('n', 'grt', fzf.lsp_typedefs, { buffer = event.buf, desc = 'Type definitions' })

          local client = vim.lsp.get_client_by_id(event.data.client_id)

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
                ignoreSubmodules = true,
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

      local virt_text_opts = {
        spacing = 4,
        source = 'if_many',
        virt_text_pos = 'eol_right_align',
      }

      local show_virt_text = false

      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        update_in_insert = false,
        virtual_text = show_virt_text,
      }

      vim.keymap.set('n', '<leader>tv', function()
        show_virt_text = not show_virt_text
        vim.diagnostic.config {
          virtual_text = show_virt_text and virt_text_opts or false,
        }
      end, { desc = 'Toggle Virtual Text' })
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

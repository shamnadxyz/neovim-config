vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { buffer = event.buf, desc = 'Rename' })
    vim.keymap.set({ 'n', 'x' }, 'gra', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'Code actions' })
    vim.keymap.set('n', 'grr', vim.lsp.buf.references, { buffer = event.buf, desc = 'References' })
    vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, { buffer = event.buf, desc = 'Implementations' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = event.buf, desc = 'Definitions' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = 'Declarations' })
    vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol, { buffer = event.buf, desc = 'Document symbols' })
    vim.keymap.set('n', 'gW', vim.lsp.buf.workspace_symbol, { buffer = event.buf, desc = 'Workspace symbols' })
    vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition, { buffer = event.buf, desc = 'Type definitions' })

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
  prismals = {},
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

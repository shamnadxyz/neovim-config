local treesitter = require 'nvim-treesitter'

treesitter.install {
  'bash',
  'c',
  'cpp',
  'css',
  'diff',
  'gitcommit',
  'html',
  'javascript',
  'json',
  'lua',
  'markdown',
  'markdown_inline',
  'python',
  'query',
  'rust',
  'ssh_config',
  'svelte',
  'toml',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
}

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('start-treesitter', { clear = true }),
  callback = function(event)
    local lang = vim.treesitter.language.get_lang(event.match)
    if lang then
      pcall(vim.treesitter.start, event.buf, lang)
    end
  end,
})

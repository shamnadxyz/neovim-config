local treesitter = require 'nvim-treesitter'

treesitter.install {
  -- 'c',
  -- 'cpp',
  -- 'css',
  -- 'html',
  -- 'hyprlang',
  -- 'javascript',
  'bash',
  'gitcommit',
  'json',
  'lua',
  'markdown',
  'python',
  'ssh_config',
  -- 'rust',
  -- 'sql',
  -- 'svelte',
  -- 'toml',
  -- 'typescript',
  -- 'yaml',
  -- 'zsh',
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

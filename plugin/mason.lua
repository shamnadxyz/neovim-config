vim.pack.add {
  {
    src = 'https://github.com/mason-org/mason.nvim',
    version = vim.version.range('2.x'),
    name = 'mason'
  }
}

local mason = require 'mason'

mason.setup()

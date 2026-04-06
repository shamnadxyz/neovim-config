vim.pack.add {
  {
    src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    version = vim.version.range '8.x',
  },
}

local render = require 'render-markdown'

render.setup {
  enabled = true,
  heading = {
    enabled = false,
  },
  sign = { enabled = false },
}

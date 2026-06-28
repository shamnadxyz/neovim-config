local custom_hl = require 'custom-hl'

local config = {
  transparent = true,
}

custom_hl.setup(config)

vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  desc = 'Apply custom highlights after loading colorscheme',
  group = vim.api.nvim_create_augroup('apply-hl', { clear = true }),
  callback = function()
    custom_hl.setup(config)
  end,
})

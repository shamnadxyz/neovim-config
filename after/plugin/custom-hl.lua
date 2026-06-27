vim.api.nvim_create_autocmd({ 'VimEnter', 'ColorScheme' }, {
  desc = 'Apply custom highlights after loading colorscheme',
  group = vim.api.nvim_create_augroup('apply-hl', { clear = true }),
  callback = function()
    require('custom-hl').setup { transparent = false }
  end,
})

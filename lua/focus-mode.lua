local M = {}

local focus_mode = false

M.enable_focus_mode = function()
  vim.o.statusline = '%s'
  vim.opt.signcolumn = 'no'
  vim.opt.number = false
  vim.opt.relativenumber = false
end

M.disable_focus_mode = function()
  vim.o.statusline = ''
  vim.opt.signcolumn = 'yes'
  vim.opt.number = true
  vim.opt.relativenumber = true
end

M.toggle_focus_mode = function()
  focus_mode = not focus_mode

  if focus_mode then
    M.enable_focus_mode()
  else
    M.disable_focus_mode()
  end
end

return M

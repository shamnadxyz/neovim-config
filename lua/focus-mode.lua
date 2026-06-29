local M = {}

local focus_mode = false

M.toggle_focus_mode = function()
  focus_mode = not focus_mode

  if focus_mode then
    vim.opt.signcolumn = 'no'
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt.laststatus = 0
  else
    vim.opt.signcolumn = 'yes'
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.laststatus = 2
  end
end

return M

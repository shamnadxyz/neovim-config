local notify = require("mini.notify")

local win_config = function()
  local has_statusline = vim.o.laststatus > 0
  local pad = vim.o.cmdheight + (has_statusline and 1 or 0) + 1
  return {
    anchor = "SE",
    col = vim.o.columns - 1,
    row = vim.o.lines - pad,
    border = "none",
  }
end

notify.setup({
  content = {
    format = function(notification)
      return notification.msg
    end,
  },
  window = {
    config = win_config,
  },
})

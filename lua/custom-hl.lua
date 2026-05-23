local M = {}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local neogit = {
  diff_add = { bg = '#003415', fg = '#b8e1c1' },
  diff_add_inline = { bg = '#3a7448', fg = '#d1ebd6' },
  diff_add_highlight = { bg = '#295233', fg = '#addbb6' },
  diff_delete = { bg = '#410d14', fg = '#fac5c7' },
  diff_delete_inline = { bg = '#7b211f', fg = '#fde7e5' },
  diff_delete_highlight = { bg = '#521615', fg = '#f9bdb6' },
}

local function get_hl(name)
  return vim.api.nvim_get_hl(0, { name = name })
end

---@class Opts
---@field transparent? boolean
local defauts = {
  transparent = false,
}

---@param opts Opts
function M.setup(opts)
  opts = vim.tbl_deep_extend('force', defauts, opts or {})
  local status_line = get_hl 'StatusLine'
  local normal = get_hl 'Normal'

  if opts.transparent then
    hl('Normal', { fg = normal.fg, bg = nil })
    hl('NormalFloat', { fg = normal.fg, bg = nil })
  end

  hl('StatusLine', { fg = status_line.fg, bg = nil })

  hl('NeogitDiffAdd', neogit.diff_add)
  hl('NeogitDiffAddHighlight', neogit.diff_add_highlight)
  hl('NeogitDiffDelete', neogit.diff_delete)
  hl('NeogitDiffDeleteHighlight', neogit.diff_delete_highlight)
  hl('NeogitDiffDeleteInline', neogit.diff_delete_inline)
  hl('NeogitDiffAddInline', neogit.diff_add_inline)

  hl('MiniPickPrompt', { fg = normal.fg })
  hl('MiniPickBorderText', { fg = status_line.fg, bg = status_line.bg })
end

return M

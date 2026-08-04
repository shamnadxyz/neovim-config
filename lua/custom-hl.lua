local M = {}

local function hl(group, opts) vim.api.nvim_set_hl(0, group, opts) end

local neogit = {
  diff_add = { bg = '#003415', fg = '#b8e1c1' },
  diff_add_inline = { bg = '#3a7448', fg = '#d1ebd6' },
  diff_add_highlight = { bg = '#295233', fg = '#addbb6' },
  diff_delete = { bg = '#410d14', fg = '#fac5c7' },
  diff_delete_inline = { bg = '#7b211f', fg = '#fde7e5' },
  diff_delete_highlight = { bg = '#521615', fg = '#f9bdb6' },
}

local function get_hl(name) return vim.api.nvim_get_hl(0, { name = name }) end

---@class Opts
---@field transparent? boolean
local defauts = {
  transparent = false,
}

local transparent = false
local highlights

local function get_colorscheme_highlights()
  return {
    non_text = get_hl 'NonText',
    status_line_nc = get_hl 'StatusLineNC',
    normal = get_hl 'Normal',
    folded = get_hl 'Folded',
    special = get_hl 'Special',
    diagnostic_hint = get_hl 'DiagnosticHint',
  }
end

local function apply_highlights()
  hl('NormalFloat', { fg = highlights.normal.fg, bg = nil })
  hl('StatusLine', { fg = highlights.status_line_nc.fg, bg = nil })
  hl('Folded', { fg = highlights.folded.fg, bg = nil })

  hl('NeogitDiffAdd', neogit.diff_add)
  hl('NeogitDiffAddHighlight', neogit.diff_add_highlight)
  hl('NeogitDiffDelete', neogit.diff_delete)
  hl('NeogitDiffDeleteHighlight', neogit.diff_delete_highlight)
  hl('NeogitDiffDeleteInline', neogit.diff_delete_inline)
  hl('NeogitDiffAddInline', neogit.diff_add_inline)

  hl('MiniPickPrompt', { fg = highlights.normal.fg })
  hl('MiniPickPromptPrefix', { fg = highlights.non_text.fg })
  hl('MiniPickBorder', { fg = highlights.non_text.fg })
  hl('MiniPickBorderText', { fg = highlights.status_line_nc.fg, bg = highlights.status_line_nc.bg })

  if transparent then
    hl('Normal', { fg = highlights.normal.fg, bg = nil })
    hl('DiagnosticFloatingHint', { bg = nil, fg = highlights.special.fg })
  end
end

---@param opts Opts
function M.setup(opts)
  opts = vim.tbl_deep_extend('force', defauts, opts or {})
  transparent = opts.transparent
  highlights = get_colorscheme_highlights()
  apply_highlights()
end

M.toggle_transparency = function()
  transparent = not transparent
  if transparent then
    hl('Normal', { fg = highlights.normal.fg, bg = nil })
    hl('DiagnosticFloatingHint', { bg = nil, fg = highlights.special.fg })
  else
    hl('Normal', { fg = highlights.normal.fg, bg = highlights.normal.bg })
    hl('DiagnosticFloatingHint', { bg = highlights.diagnostic_hint.bg, fg = highlights.special.fg })
  end
end

vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  desc = 'Apply custom highlights after loading colorscheme',
  group = vim.api.nvim_create_augroup('apply-hl', { clear = true }),
  callback = apply_highlights,
})

return M

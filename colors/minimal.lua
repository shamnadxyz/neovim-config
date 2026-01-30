vim.cmd 'hi clear'
vim.cmd 'syntax reset'
vim.g.colors_name = 'minimal'

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Color Palette
local dark_blue = '#1e4b69'
local dark_cyan = '#297170'
local dark_green = '#295233'
local dark_grey1 = '#07080d'
local dark_grey2 = '#14161b'
local dark_grey3 = '#2c2e33'
local dark_grey4 = '#4f5258'
local dark_magenta = '#5d395a'
local dark_red = '#521615'
local dark_yellow = '#574514'
local light_blue = '#a3d5f7'
local light_cyan = '#a0dbda'
local light_grey1 = '#eef1f8'
local light_grey2 = '#e0e2ea'
local light_grey3 = '#c4c6cd'
local light_grey4 = '#9b9ea4'
local light_green = '#addbb6'
local light_magenta = '#d6afd6'
local light_red = '#f9bdb6'
local light_yellow = '#dfcc99'

-- Plugin Styles
local neogit = {
  diff_add = { bg = '#0b1a0f', fg = '#bdecc6' },
  diff_add_highlight = { bg = '#295233', fg = '#addbb6' },
  diff_delete = { bg = '#221013', fg = '#ffcdc6' },
  diff_delete_highlight = { bg = '#521615', fg = '#f9bdb6' },
}

-- Plugin highlights

-- Neogit
hl('NeogitDiffAdd', neogit.diff_add)
hl('NeogitDiffAddHighlight', neogit.diff_add_highlight)
hl('NeogitDiffDelete', neogit.diff_delete)
hl('NeogitDiffDeleteHighlight', neogit.diff_delete_highlight)

-- MiniPick
hl('MiniPickNormal', { bg = nil })
hl('MiniPickBorder', { bg = nil })
hl('MiniPickPrompt', { bg = nil })
hl('MiniPickBorderText', { bg = dark_grey3 })

-- Editor highlights
hl('Normal', { fg = light_grey2, bg = dark_grey2 })
-- Uncomment the line below and comment the above for transparent background
-- hl("Normal", { fg = light_grey2, bg = nil })

hl('Added', { fg = light_green })
hl('Changed', { fg = light_yellow })
hl('ColorColumn', { bg = dark_grey4 })
hl('Conceal', { fg = dark_grey4 })
hl('CurSearch', { fg = dark_grey1, bg = light_yellow })
hl('CursorColumn', { bg = dark_grey3 })
hl('CursorLine', { bg = dark_grey3 })
hl('DiffAdd', { fg = light_grey1, bg = dark_green })
hl('DiffChange', { fg = light_grey1, bg = dark_grey4 })
hl('DiffDelete', { fg = light_red, bold = true })
hl('DiffText', { fg = light_grey1, bg = dark_cyan })
hl('Directory', { fg = light_cyan })
hl('ErrorMsg', { fg = light_red })
hl('FloatShadow', { bg = dark_grey4 })
hl('FloatShadowThrough', { bg = dark_grey4 })
hl('Folded', { fg = light_grey4, bg = dark_grey1 })
hl('LineNr', { fg = dark_grey4 })
hl('MatchParen', { bg = dark_grey4, bold = true })
hl('ModeMsg', { fg = light_green })
hl('MoreMsg', { fg = light_cyan })
hl('NonText', { fg = dark_grey3 })
hl('NormalFloat', { bg = dark_grey1 })
hl('OkMsg', { fg = light_green })
hl('Pmenu', { bg = dark_grey3 })
hl('PmenuThumb', { bg = dark_grey4 })
hl('Question', { fg = light_cyan })
hl('QuickFixLine', { fg = light_cyan })
hl('RedrawDebugClear', { bg = dark_yellow })
hl('RedrawDebugComposed', { bg = dark_green })
hl('RedrawDebugRecompose', { bg = dark_red })
hl('Removed', { fg = light_red })
hl('Search', { fg = light_grey1, bg = dark_yellow })
hl('SignColumn', { fg = dark_grey4 })
hl('SpecialKey', { fg = dark_grey4 })
hl('SpellBad', { sp = light_red, undercurl = true })
hl('SpellCap', { sp = light_yellow, undercurl = true })
hl('SpellLocal', { sp = light_green, undercurl = true })
hl('SpellRare', { sp = light_cyan, undercurl = true })
hl('StatusLine', { fg = light_grey2, bg = dark_grey3 })
hl('StatusLineNC', { fg = light_grey3, bg = dark_grey1 })
hl('Title', { fg = light_grey2, bold = true })
hl('Visual', { bg = dark_grey4 })
hl('WarningMsg', { fg = light_yellow })
hl('WinBar', { fg = light_grey4, bg = dark_grey1, bold = true })
hl('WinBarNC', { fg = light_grey4, bg = dark_grey1 })

-- Syntax
hl('Constant', { fg = light_grey2 })
hl('Operator', { fg = light_grey2 })
hl('PreProc', { fg = light_grey2 })
hl('Type', { fg = light_grey2 })
hl('Delimiter', { fg = light_grey2 })
hl('Comment', { fg = light_grey4 })
hl('String', { fg = light_green })
hl('Identifier', { fg = light_blue })
hl('Function', { fg = light_cyan })
hl('Statement', { fg = light_grey2, bold = true })
hl('Special', { fg = light_cyan })
hl('Error', { fg = light_grey1, bg = dark_red })
hl('Todo', { fg = light_grey2, bold = true })

-- Diagnostic
hl('DiagnosticError', { fg = light_red })
hl('DiagnosticWarn', { fg = light_yellow })
hl('DiagnosticInfo', { fg = light_cyan })
hl('DiagnosticHint', { fg = light_blue })
hl('DiagnosticOk', { fg = light_green })
hl('DiagnosticUnderlineError', { sp = light_red, underline = true })
hl('DiagnosticUnderlineWarn', { sp = light_yellow, underline = true })
hl('DiagnosticUnderlineInfo', { sp = light_cyan, underline = true })
hl('DiagnosticUnderlineHint', { sp = light_blue, underline = true })
hl('DiagnosticUnderlineOk', { sp = light_green, underline = true })
hl('DiagnosticDeprecated', { sp = light_red, strikethrough = true })

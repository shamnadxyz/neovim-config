vim.cmd 'hi clear'
vim.cmd 'syntax reset'
vim.g.colors_name = 'fuyu'

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Color Palette
local dark_blue = '#004972'
local dark_cyan = '#005156'
local dark_green = '#1b511f'
local dark_grey1 = '#141923'
local dark_grey2 = '#20252f'
local dark_grey3 = '#343944'
local dark_grey4 = '#494e5a'
local dark_magenta = '#4d3670'
local dark_red = '#6f2a2d'
local dark_yellow = '#725921'
local light_blue = '#a1d6fd'
local light_cyan = '#90dfe3'
local light_grey1 = '#edeff6'
local light_grey2 = '#dbe3f1'
local light_grey3 = '#c4c6cd'
local light_grey4 = '#9b9ea4'
local light_green = '#b0ddb0'
local light_magenta = '#e9beeb'
local light_red = '#febbba'
local light_yellow = '#d6d297'

hl('Normal', { fg = light_grey2, bg = dark_grey2 })

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
hl('DiffText', { fg = light_grey1, bg = dark_blue })
hl('Directory', { fg = light_blue })
hl('ErrorMsg', { fg = light_red })
hl('FloatShadow', { bg = dark_grey4 })
hl('FloatShadowThrough', { bg = dark_grey4 })
hl('Folded', { fg = light_grey4, bg = dark_grey1 })
hl('LineNr', { fg = dark_grey4 })
hl('MatchParen', { bg = dark_grey4, bold = true })
hl('ModeMsg', { fg = light_green })
hl('MoreMsg', { fg = light_blue })
hl('NonText', { fg = dark_grey3 })
hl('NormalFloat', { bg = dark_grey1 })
hl('OkMsg', { fg = light_green })
hl('Pmenu', { bg = dark_grey3 })
hl('PmenuThumb', { bg = dark_grey4 })
hl('Question', { fg = light_blue })
hl('QuickFixLine', { fg = light_blue })
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
hl('SpellRare', { sp = light_blue, undercurl = true })
hl('StatusLine', { fg = light_grey2, bg = nil })
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
hl('Identifier', { fg = light_grey2 })
hl('Function', { fg = light_blue })
hl('Statement', { fg = light_grey2, bold = true })
hl('Special', { fg = light_blue })
hl('Error', { fg = light_grey1, bg = dark_red })
hl('Todo', { fg = light_grey2, bold = true })

-- LSP
hl('LspInlayHint', { fg = light_grey4 })

-- Diagnostic
hl('DiagnosticError', { fg = light_red })
hl('DiagnosticWarn', { fg = light_yellow })
hl('DiagnosticInfo', { fg = light_blue })
hl('DiagnosticHint', { fg = light_cyan })
hl('DiagnosticOk', { fg = light_green })
hl('DiagnosticUnderlineError', { sp = light_red, underline = true })
hl('DiagnosticUnderlineWarn', { sp = light_yellow, underline = true })
hl('DiagnosticUnderlineInfo', { sp = light_blue, underline = true })
hl('DiagnosticUnderlineHint', { sp = light_cyan, underline = true })
hl('DiagnosticUnderlineOk', { sp = light_green, underline = true })
hl('DiagnosticDeprecated', { sp = light_red, strikethrough = true })

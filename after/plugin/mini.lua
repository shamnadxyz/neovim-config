-- Mini.hues {{{
vim.cmd.colorscheme 'miniwinter'

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hl('StatusLine', { fg = '#d8d4cd', bg = nil })
hl('TelescopeTitle', { fg = '#b3daf9', bg = '#11262d' })
hl('Normal', { fg = '#d8d4cd', bg = nil })

local neogit = {
  diff_add = { bg = '#003415', fg = '#b8e1c1' },
  diff_add_inline = { bg = '#3a7448', fg = '#d1ebd6' },
  diff_add_highlight = { bg = '#295233', fg = '#addbb6' },
  diff_delete = { bg = '#410d14', fg = '#fac5c7' },
  diff_delete_inline = { bg = '#7b211f', fg = '#fde7e5' },
  diff_delete_highlight = { bg = '#521615', fg = '#f9bdb6' },
}

hl('NeogitDiffAdd', neogit.diff_add)
hl('NeogitDiffAddHighlight', neogit.diff_add_highlight)
hl('NeogitDiffDelete', neogit.diff_delete)
hl('NeogitDiffDeleteHighlight', neogit.diff_delete_highlight)
hl('NeogitDiffDeleteInline', neogit.diff_delete_inline)
hl('NeogitDiffAddInline', neogit.diff_add_inline)


-- }}}

-- vim:foldmethod=marker

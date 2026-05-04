-- Mini.hues {{{
vim.cmd.colorscheme 'miniwinter'

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hl('StatusLine', { fg = '#d8d4cd', bg = nil })
hl('TelescopeTitle', { fg = '#b3daf9', bg = '#11262d' })
hl('Normal', { fg = '#d8d4cd', bg = nil })
-- }}}

-- vim:foldmethod=marker

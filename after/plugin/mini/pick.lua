local pick = require 'mini.pick'

pick.setup {
  delay = {
    -- Delay between forcing asynchronous behavior
    async = 10,
    -- Delay between computation start and visual feedback about it
    busy = 50,
  },

  mappings = {
    caret_left = '<Left>',
    caret_right = '<Right>',

    choose = '<CR>',
    choose_in_split = '<C-s>',
    choose_in_tabpage = '',
    choose_in_vsplit = '',
    choose_marked = '<C-q>',

    delete_char = '<BS>',
    delete_char_right = '<Del>',
    delete_left = '<C-u>',
    delete_word = '<C-w>',

    mark = '<Tab>',
    mark_all = '<C-a>',

    move_down = '<C-n>',
    move_start = '<C-g>',
    move_up = '<C-p>',

    paste = '<C-r>',

    refine = '<C-Space>',
    refine_marked = '<M-Space>',

    scroll_down = '<C-j>',
    scroll_left = '<C-h>',
    scroll_right = '<C-l>',
    scroll_up = '<C-k>',

    stop = '<Esc>',

    toggle_info = '<S-Tab>',
    toggle_preview = '<C-v>',
  },

  options = {
    content_from_bottom = false,
    use_cache = true,
  },
  source = { show = pick.default_show },
  window = {
    prompt_caret = '█',
    config = function()
      local height = math.floor(0.7 * vim.o.lines)
      local width = math.floor(0.7 * vim.o.columns)
      return {
        anchor = 'NW',
        height = height,
        width = width,
        row = math.floor(0.4 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
        border = 'rounded',
      }
    end,
  },
}

local project_files = function()
  pick.builtin.files { tool = 'git' }
end
local search_files = function()
  pick.builtin.files { tool = 'fd' }
end

vim.keymap.set('n', '<leader>sf', search_files, { desc = 'Search files' })
vim.keymap.set('n', '<leader>sp', project_files, { desc = 'Search project git files' })
vim.keymap.set('n', '<leader>sh', pick.builtin.help, { desc = 'Search help' })
vim.keymap.set('n', '<leader>sg', pick.builtin.grep_live, { desc = 'Search by grep' })
vim.keymap.set('n', '<leader>sb', pick.builtin.buffers, { desc = 'Search buffers' })
vim.keymap.set('n', '<leader>sr', pick.builtin.resume, { desc = 'Search resume' })

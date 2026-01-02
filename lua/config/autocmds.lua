-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Check for file changes when gaining focus or leaving terminal
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  desc = 'Check for file changes when gaining focus or leaving terminal',
  group = vim.api.nvim_create_augroup('checktime', { clear = true }),
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd 'checktime'
    end
  end,
})

-- Auto-create parent directories when saving files
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  desc = 'Auto-create parent directories when saving files',
  group = vim.api.nvim_create_augroup('auto-create-dir', { clear = true }),
  callback = function(event)
    if event.match:match '^%w%w+:[\\/][\\/]' then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

-- Close temporary buffers with 'q'
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'help',
    'qf',
    'notify',
    'lspinfo',
    'checkhealth',
    'man',
    'gitsigns-blame',
    'diff',
  },
  desc = 'Close temporary buffers with q',
  group = vim.api.nvim_create_augroup('close-with-q', { clear = true }),
  callback = function(event)
    vim.keymap.set('n', 'q', '<CMD>:q<CR>', { buffer = event.buf, silent = true })
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  group = vim.api.nvim_create_augroup('resize_splits', { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd 'tabdo wincmd ='
    vim.cmd('tabnext ' .. current_tab)
  end,
})

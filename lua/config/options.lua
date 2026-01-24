-- Disable mouse
vim.opt.mouse = ''
vim.opt.wrap = false
-- Shows the effects of a command incrementally in a preview window
vim.opt.inccommand = 'split'

vim.opt.number = true
vim.opt.relativenumber = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- Minimal number of screen columns to keep to the left and right of the cursor
vim.opt.sidescrolloff = 10

-- Convert tabs to spaces
vim.opt.expandtab = true
-- Number of spaces that a tab character represents
vim.opt.tabstop = 2
-- Number of spaces for each tab during editing
vim.opt.softtabstop = 2
-- Number of spaces for each indentation level
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Highlight the matched string
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Save undo history across sessions
vim.opt.undofile = true
vim.opt.swapfile = false

-- Useful to see the difference between tabs and spaces and for trailing blanks
vim.opt.list = true
vim.opt.listchars = {
  leadmultispace = ' ',
  multispace = '---+',
  nbsp = '+',
  tab = '<->',
  trail = '-',
}

-- Always draw the signcolumn
vim.opt.signcolumn = 'yes'
-- Enable true color support in terminal
vim.opt.termguicolors = true

-- Spell checking configuration
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- Open new vertical splits to the right of current window
vim.opt.splitright = true
-- Open new horizontal splits below current window
vim.opt.splitbelow = true

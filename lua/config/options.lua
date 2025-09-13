-- General UI and Behavior
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = ""

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
vim.opt.relativenumber = false

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Show which line your cursor is on
vim.opt.cursorline = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- If performing an operation that would fail due to unsaved changes (like `:q`),
-- raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = true

-- Disable line cursor (remove blinking block cursor)
--vim.opt.guicursor = ""

-- Editor Behavior
-- Convert tabs to spaces
vim.opt.expandtab = true

-- Number of spaces that a tab character represents
vim.opt.tabstop = 2

-- Number of spaces for each tab during editing
vim.opt.softtabstop = 2

-- Number of spaces for each indentation level
vim.opt.shiftwidth = 2

-- Enable smart auto-indenting for new lines
vim.opt.smartindent = true

-- Disable line wrapping at window edge
vim.opt.wrap = false

-- Append special characters to filename detection
vim.opt.isfname:append("@-@")

-- Search and Navigation
-- Highlight all search matches
vim.opt.hlsearch = true

-- Show search matches as you type
vim.opt.incsearch = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Backup & Recovery
-- Disable swap file creation
vim.opt.swapfile = false

-- Disable backup file creation
vim.opt.backup = false

-- Save undo history across sessions
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Appearance
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Always show sign column for diagnostics/gutter
vim.opt.signcolumn = "yes"

-- Enable true color support in terminal
vim.opt.termguicolors = true

-- Show visual guide at column 80 (commented out)
vim.opt.colorcolumn = "80"

-- Spell checking configuration
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Performance
-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Window Management
-- Open new vertical splits to the right of current window
vim.opt.splitright = true

-- Open new horizontal splits below current window
vim.opt.splitbelow = true

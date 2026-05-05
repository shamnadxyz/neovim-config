-- NEOVIM CONFIG

-- OPTIONS {{{
vim.g.mapleader = " "

vim.o.mouse = "a"
vim.o.undofile = true
vim.o.undolevels = 500
vim.o.breakindent = true
vim.o.breakindentopt = "list:-1"
vim.o.colorcolumn = "+1"
vim.o.cursorline = true
vim.o.linebreak = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.pumheight = 10
vim.o.ruler = false
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.splitkeep = "screen"
vim.o.splitright = true
vim.o.wrap = false
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.inccommand = "split"
vim.o.termguicolors = true
vim.o.fillchars = "eob: ,fold:╌"
vim.o.foldlevel = 10
vim.o.foldnestmax = 10
vim.o.foldtext = ""
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.infercase = true
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.confirm = true
vim.o.spelllang = "en_us"
vim.o.spell = false
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.swapfile = false
vim.o.backup = false
-- }}}

-- KEYMAPS {{{
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set(
  "x",
  "<leader>p",
  [["_dP]],
  { desc = "Replace selection without affecting clipboard" }
)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank whole line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without affecting clipboard" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set(
  "n",
  "<leader>l",
  vim.diagnostic.setloclist,
  { desc = "Open diagnostics in location list" }
)
vim.keymap.set("n", "<TAB>", "za", { desc = "Toggle Fold" })
-- }}}

-- AUTOCMDS {{{
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  desc = "Check for file changes when gaining focus or leaving terminal",
  group = vim.api.nvim_create_augroup("checktime", { clear = true }),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "qf",
    "notify",
    "lspinfo",
    "checkhealth",
    "man",
    "gitsigns-blame",
    "diff",
  },
  desc = "Close temporary buffers with q",
  group = vim.api.nvim_create_augroup("close-with-q", { clear = true }),
  callback = function(event)
    vim.keymap.set("n", "q", "<CMD>:q<CR>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  desc = "resize splits if window got resized",
  group = vim.api.nvim_create_augroup("resize_splits", { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})
-- }}}

-- PLUGINS {{{
vim.pack.add({
  {
    src = "https://github.com/saghen/blink.indent",
    version = vim.version.range("2.x"),
  },
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.x"),
  },
  {
    src = "https://github.com/stevearc/conform.nvim",
    version = vim.version.range("9.x"),
  },
  {
    src = "https://github.com/folke/todo-comments.nvim",
    version = "stable",
  },
  {
    src = "https://github.com/nvim-lua/plenary.nvim",
  },
  {
    src = "https://github.com/folke/which-key.nvim",
    version = "stable",
  },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  {
    src = "https://github.com/lewis6991/gitsigns.nvim",
    version = vim.version.range("2.x"),
  },
  {
    src = "https://github.com/MagicDuck/grug-far.nvim",
    version = vim.version.range("1.6.x"),
  },
  {
    src = "https://github.com/j-hui/fidget.nvim",
    version = vim.version.range("1.6.x"),
  },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-mini/mini.nvim", version = "stable" },
  { src = "https://github.com/mfussenegger/nvim-lint" },
  {
    src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    version = vim.version.range("8.x"),
  },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/sindrets/diffview.nvim" },
  { src = "https://github.com/NeogitOrg/neogit" },
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
  },
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter-context",
  },
  {
    src = "https://github.com/folke/trouble.nvim",
    version = vim.version.range("3.7.x"),
  },
})

vim.cmd(":packadd nvim.undotree")
-- }}}

require("vim._core.ui2").enable()
-- vim:foldmethod=marker:foldenable:foldlevel=0

-- Leader Key Setup
-- Set space as the global leader key (primary shortcut prefix)
vim.g.mapleader = " "

-- Set space as the local leader key (buffer-specific shortcuts)
vim.g.maplocalleader = " "

-- Text Movement & Editing
-- Move selected lines up/down in visual mode (with auto-indent preservation)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when joining lines (J)
vim.keymap.set("n", "J", "mzJ`z")

-- Center cursor when scrolling half-page (C-d/C-u)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center cursor when searching (n/N)
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clipboard Management
-- Paste without yanking (avoid overwriting register)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to system clipboard (all modes)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without yanking (silent delete)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Search & Replace
-- Substitute current word with <leader>s
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Clear search highlights when pressing Escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Navigate diagnostics (quickfix)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Next/previous error (quickfix list)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Next/previous error (location list)
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- System Operations
-- Disable Ex mode (accidental Q press)
vim.keymap.set("n", "Q", "<nop>")

-- Navigation Safety
-- Disable arrow keys with helpful guidance
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

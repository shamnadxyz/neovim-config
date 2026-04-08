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

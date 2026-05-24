local fzf = require("fzf-lua")

fzf.register_ui_select()

fzf.setup({
  "ivy",
  winopts = {
    backdrop = 100,
    fullscreen = true,
    preview = {
      hidden = false,
      vertical = "up:60%",
    },
  },
  keymap = {
    builtin = {
      true,
      ["<C-d>"] = "preview-page-down",
      ["<C-u>"] = "preview-page-up",
    },
    fzf = {
      true,
      ["ctrl-d"] = "preview-page-down",
      ["ctrl-u"] = "preview-page-up",
      ["ctrl-q"] = "select-all+accept",
    },
  },
  buffers = {
    keymap = { builtin = { ["<C-d>"] = false } },
  },
})

vim.keymap.set("n", "<leader>sf", function()
  fzf.files({ cwd_prompt = false })
end, { desc = "Search files" })

vim.keymap.set("n", "<leader>sp", fzf.git_files, { desc = "Search git files" })
vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "Search current project" })
vim.keymap.set("n", "<leader>sh", fzf.help_tags, { desc = "Search help tags" })
vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "Search keymaps" })
vim.keymap.set("n", "<leader>ss", fzf.builtin, { desc = "Search fzf builtins" })
vim.keymap.set("n", "<leader>sd", fzf.diagnostics_document, { desc = "Search diagnostics" })
vim.keymap.set("n", "<leader>sr", fzf.resume, { desc = "Resume search" })
vim.keymap.set("n", "<leader>so", fzf.oldfiles, { desc = "Search old files" })
vim.keymap.set("n", "<leader>sb", fzf.buffers, { desc = "Search buffers" })

vim.opt_local.conceallevel = 0

vim.keymap.set("n", "<leader>tm", "<cmd>RenderMarkdown toggle<cr>", {
  buffer = true,
  desc = "Toggle markdown render",
})

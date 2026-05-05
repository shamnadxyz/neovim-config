local neogit = require("neogit")

neogit.setup()

vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<cr>", { desc = "Show Neogit UI" })

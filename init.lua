require("keymaps")
require("options")
require("autocmds")
require("plugins")

-- Enable Experimental UI2
require("vim._core.ui2").enable()

vim.cmd.colorscheme("minimal")
require("custom-hl").setup({ transparent = true })

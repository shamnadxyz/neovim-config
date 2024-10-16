require("null")
require("null.set")
-- Installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Install packages
require('lazy').setup({
	-- LSP
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
    -- Telescope
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- Colorscheme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- Treesitter
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {'nvim-treesitter/playground'},
    {'nvim-treesitter/nvim-treesitter-context'},
    -- Git related plugins
    {'tpope/vim-fugitive'},
    {'tpope/vim-rhubarb'},
    {'mbbill/undotree'},
    {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependancies = {"nvim-lua/plenary.nvim"}
    },
    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons', opt = true}
    },
    -- comment
    {'numToStr/Comment.nvim'},
    {'lukas-reineke/indent-blankline.nvim'},
})

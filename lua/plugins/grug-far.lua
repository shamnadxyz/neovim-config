return {
  {
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      local grug_far = require 'grug-far'
      grug_far.setup {

        -- Launch with the current word under the cursor as the search string
        vim.keymap.set({ 'n', 'x' }, '<leader>gr', function()
          grug_far.open { prefills = { search = vim.fn.expand '<cword>' } }
        end, { desc = 'Grug replace' }),

        -- Launch with ast-grep engine
        vim.keymap.set({ 'n', 'x' }, '<leader>ga', function()
          grug_far.open { engine = 'astgrep' }
        end, { desc = 'Grug AST' }),

        -- Launch, limiting search/replace to current file
        vim.keymap.set({ 'n', 'x' }, '<leader>gf', function()
          grug_far.open { prefills = { paths = vim.fn.expand '%' } }
        end, { desc = 'Grug file' }),
      }
    end,
  },
}

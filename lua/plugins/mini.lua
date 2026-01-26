return {
  {
    'nvim-mini/mini.pick',
    version = '*',
    config = function()
      local pick = require("mini.pick")

      pick.setup({
        source = {
          show = pick.default_show
        },
        window = {
          config = {
            border = 'rounded' }
        }
      })

      local project_files = function()
        pick.builtin.files({ tool = 'git' })
      end
      local search_files = function()
        pick.builtin.files({ tool = 'fd' })
      end

      vim.keymap.set('n', '<leader>sf', search_files, { desc = 'Search files' })
      vim.keymap.set('n', '<leader>sp', project_files, { desc = 'Search project git files' })
      vim.keymap.set('n', '<leader>sh', pick.builtin.help, { desc = 'Search help' })
      vim.keymap.set('n', '<leader>sg', pick.builtin.grep_live, { desc = 'Search by grep' })
      vim.keymap.set('n', '<leader>sb', pick.builtin.buffers, { desc = 'Search buffers' })
      vim.keymap.set('n', '<leader>sr', pick.builtin.resume, { desc = 'Search resume' })

      vim.api.nvim_set_hl(0, "MiniPickNormal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "MiniPickBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "MiniPickPrompt", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "MiniPickBorderText", { bg = "#2C2E33" })
    end
  }
}

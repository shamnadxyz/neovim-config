return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
  ft = { 'markdown' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    enabled = true,
    heading = {
      enabled = false,
    },
    sign = { enabled = false },
  },
}

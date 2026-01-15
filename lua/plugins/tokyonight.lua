return {
  'folke/tokyonight.nvim',
  enabled = false,
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup {
      style = 'night',
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false, bold = true },
      },
    }

    vim.cmd.colorscheme 'tokyonight'
  end,
}

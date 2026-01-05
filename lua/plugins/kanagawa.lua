return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  config = function()
    require('kanagawa').setup {
      compile = true,
      transparent = true,
    }

    vim.cmd 'colorscheme kanagawa-dragon'
  end,
}

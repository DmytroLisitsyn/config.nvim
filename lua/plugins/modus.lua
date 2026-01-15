return {
  'miikanissi/modus-themes.nvim',
  priority = 1000,
  config = function()
    require('modus-themes').setup {
      variant = 'default',
      transparent = true,
      line_nr_column_background = false,
      sign_column_background = false,
      styles = {
        keywords = { italic = false, bold = true },
      },
    }

    vim.cmd.colorscheme 'modus'
  end,
}

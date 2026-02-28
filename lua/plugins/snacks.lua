return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    image = { enabled = true },
    rename = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },
  },
}

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    notifier = { enabled = false },
    notify = { enabled = false },
    rename = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },
  },
}

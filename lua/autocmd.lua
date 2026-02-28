-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Start Treesitter for highlighting and folding natively in Nvim 0.11+
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable treesitter for all supported filetypes',
  callback = function()
    -- `vim.treesitter.start()` uses native C-based highlighting
    -- It gracefully fails and ignores filetypes without an installed parser
    pcall(vim.treesitter.start)

    -- Optional: Use treesitter for folds
    vim.opt_local.foldmethod = 'expr'
    vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- Prevent folding on opening files
    vim.opt_local.foldlevel = 99
  end,
})

-- Custom language to file relations
vim.filetype.add {
  filename = {
    ['Appfile'] = 'ruby',
    ['Fastfile'] = 'ruby',
    ['Matchfile'] = 'ruby',
    ['Pluginfile'] = 'ruby',
    ['Snapfile'] = 'ruby',
  },
}

-- Custom Highlight Overrides
local function apply_custom_highlights()
  -- Make line numbers grey like comments
  local comment_hl = vim.api.nvim_get_hl(0, { name = 'Comment' })
  if comment_hl and comment_hl.fg then
    vim.api.nvim_set_hl(0, 'LineNr', { fg = comment_hl.fg })
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = comment_hl.fg })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = comment_hl.fg })
  end

  -- Helper to strip background from a highlight group
  local function make_transparent(hl_name)
    local hl = vim.api.nvim_get_hl(0, { name = hl_name, link = false })
    if hl then
      hl.bg = nil
      ---@diagnostic disable-next-line: param-type-mismatch
      vim.api.nvim_set_hl(0, hl_name, hl)
    end
  end

  -- Make floating windows transparent globally
  make_transparent 'NormalFloat'
  make_transparent 'FloatBorder'
  make_transparent 'FloatTitle'

  -- Neo-tree specific highlights
  make_transparent 'NeoTreeNormal'
  make_transparent 'NeoTreeNormalNC'
  make_transparent 'NeoTreeFloatNormal'
  make_transparent 'NeoTreeFloatBorder'

  -- Noice specific highlights
  make_transparent 'NoiceCmdlinePopup'
  make_transparent 'NoiceCmdlinePopupBorder'
end

vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Override highlight groups',
  group = vim.api.nvim_create_augroup('custom-highlights', { clear = true }),
  callback = apply_custom_highlights,
})

-- Apply immediately since colorscheme might have already loaded
apply_custom_highlights()

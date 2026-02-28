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
  },
}

return {
  'wojciech-kulik/xcodebuild.nvim',
  dependencies = {
    'ibhagwan/fzf-lua',
    'nvim-neo-tree/neo-tree.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('xcodebuild').setup {
      integrations = {
        xcode_build_server = {
          enabled = true, -- run "xcode-build-server config" when scheme changes
          guess_scheme = false, -- run "xcode-build-server config" with the scheme matching the current file's target
        },
        neo_tree = {
          enabled = true, -- enable updating Xcode project files when using neo-tree.nvim
        },
        telescope_nvim = {
          enabled = false, -- enable telescope picker
        },
        fzf_lua = {
          enabled = true, -- enable fzf-lua picker
        },
        nvim_dap = {
          enabled = true, -- enable nvim-dap integration
        },
      },
    }
  end,
  keys = {
    { '<leader>X', '<cmd>XcodebuildPicker<cr>', desc = 'Show Xcodebuild Actions' },
    { '<leader>xf', '<cmd>XcodebuildProjectManager<cr>', desc = 'Show Project Manager Actions' },
    { '<leader>xb', '<cmd>XcodebuildBuild<cr>', desc = 'Build Project' },
    { '<leader>xr', '<cmd>XcodebuildBuildRun<cr>', desc = 'Build & Run Project' },
    { '<leader>xt', '<cmd>XcodebuildTest<cr>', desc = 'Run Tests' },
    { '<leader>xT', '<cmd>XcodebuildTestClass<cr>', desc = 'Run This Test Class' },
    { '<leader>xl', '<cmd>XcodebuildToggleLogs<cr>', desc = 'Toggle Xcodebuild Logs' },
    { '<leader>xc', '<cmd>XcodebuildToggleCodeCoverage<cr>', desc = 'Toggle Code Coverage' },
    { '<leader>xq', '<cmd>XcodebuildPicker<cr>', desc = 'Show Xcodebuild Picker' },
  },
}

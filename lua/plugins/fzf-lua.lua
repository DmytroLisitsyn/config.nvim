return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local fzf = require('fzf-lua')

    -- Setup with telescope profile for familiar keymaps/UI
    fzf.setup({ 'telescope' })

    -- [[ Configure fzf-lua ]]
    vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', fzf.builtin, { desc = '[S]earch [S]elect fzf-lua' })
    vim.keymap.set('n', '<leader>sw', fzf.grep_cword, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', fzf.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Find existing buffers' })

    -- Fuzzily search in current buffer
    vim.keymap.set('n', '<leader>/', function()
      fzf.lgrep_curbuf({ winopts = { preview = { hidden = 'hidden' } } })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Search in Open Files
    vim.keymap.set('n', '<leader>s/', function()
      fzf.lines({ prompt = 'Live Grep (Open Buffers)> ' })
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      fzf.files({ cwd = vim.fn.stdpath('config') })
    end, { desc = '[S]earch [N]eovim files' })

    -- Set up vim.ui.select to use fzf-lua
    fzf.register_ui_select()
  end,
}

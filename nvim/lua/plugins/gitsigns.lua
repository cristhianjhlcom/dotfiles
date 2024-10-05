return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged_enable = true,
      signcolumn          = true,
      numhl               = true,
      linehl              = true,
      word_diff           = false,
      current_line_blame  = false,
    })

    vim.keymap.set('n', ']g', ":Gitsigns next_hunk<CR>")
    vim.keymap.set('n', '[g', ":Gitsigns next_hunk<CR>")
    vim.keymap.set('n', 'gp', ":Gitsigns preview_hunk<CR>")
    vim.keymap.set('n', 'gs', ":Gitsigns stage_hunk<CR>")
    vim.keymap.set('n', 'gS', ":Gitsigns undo_stage_hunk<CR>")
    vim.keymap.set('n', 'gsb', ":Gitsigns stage_buffer<CR>")
    vim.keymap.set('n', 'gb', ":Gitsigns blame<CR>")
    vim.keymap.set('n', '<Leader>gcc', ":G commit -m ")
        map('n', '<Leader>hs', gitsigns.stage_hunk)
        map('n', '<Leader>hu', gitsigns.undo_stage_hunk)
        map('n', '<Leader>hr', gitsigns.reset_hunk)
        map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('n', '<leader>hS', gitsigns.stage_buffer)
        map('n', '<leader>hp', gitsigns.preview_hunk)
        map('n', '<leader>hd', gitsigns.diffthis)
        map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
  end,
}

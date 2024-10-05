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
    vim.keymap.set('n', 'gpm', ":G push origin main<CR>")
  end,
}

local ok, gitsigns = pcall(require, 'gitsigns')

if not ok then
  print('Error loading gitsigns!')
end

gitsigns.setup({
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  -- signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  -- numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  -- linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  -- word_diff  = true, -- Toggle with `:Gitsigns toggle_word_diff`
  current_line_blame = true,
  -- sign_priority = 20,
})

vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
vim.keymap.set('n', '[n', ':Gitsigns prev_hunk<CR>')
vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
vim.keymap.set('n', 'gt', ':Gitsigns toggle_current_line_blame<CR>')
vim.keymap.set('n', 'glh', ':Gitsigns toggle_linehl<CR>')
vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
vim.keymap.set('n', 'gcc', ':G commit -m "')
vim.keymap.set('n', 'gst', ':G status<CR>')
vim.keymap.set('n', 'gpm', ':G push origin main<CR>')

local status_ok , gitsigns = pcall(require, 'gitsigns')

if not status_ok then
    print('Error loading gitsigns')
end

gitsigns.setup({
  current_line_blame = true,
  sign_priority = 20,
  on_attach = function(bufnr)
    vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
    vim.keymap.set('n', '[n', ':Gitsigns prev_hunk<CR>')
    vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
    vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
    vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
    vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
  end,
})

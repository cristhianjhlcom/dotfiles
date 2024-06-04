local status_ok, oil = pcall(require, 'oil')

if not status_ok then
	return
end

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<Leader>-', oil.toggle_float)

oil.setup({
	columns = { 'icon' },
	keymaps = {
		['<C-h>'] = false,
		['<M-h>'] = 'actions.select_split',
	},
	view_options = {
		show_hidden = true,
	},
})

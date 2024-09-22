local ok, devicons = pcall(require, "nvim-web-devicons")

if (not ok) then return end

devicons.setup({
	default = true
})

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeIgnore = { 'node_modules', '.git' }
vim.g.NERDTreeHighlightCursorline = 1

local keymap = vim.keymap.set

keymap('n', '<F3>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrows = 1

local keymap = vim.keymap.set

keymap('n', '<F3>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

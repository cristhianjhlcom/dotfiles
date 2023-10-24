require('cristhianjhl.remap')
require('cristhianjhl.set')
require('cristhianjhl.packer')

vim.cmd.colorscheme('catppuccin')

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

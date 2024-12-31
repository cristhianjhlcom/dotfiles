vim.opt.number = true
vim.opt.relativenumber = true
vim.g.netrw_banner = 0
vim.g.have_nerd_font = false
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.list = true
vim.opt.listchars = {
  eol = '↵',
  tab = '▸ ',
  trail = '·',
  nbsp = '_',
}
vim.opt.updatetime = 100
vim.opt.conceallevel = 1
vim.schedule(function ()
  vim.opt.clipboard = 'unnamedplus'
end)

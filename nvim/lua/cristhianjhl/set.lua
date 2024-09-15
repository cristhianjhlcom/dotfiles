vim.opt.cursorline = true
vim.g.have_nerd_font = false
vim.g.editorconfig = true
vim.g.netrw_banner = 0
vim.g.editorconfig = true
vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2
vim.o.hlsearch = true
vim.opt.colorcolumn = "100"
vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#060606]]
vim.opt.cursorline = true
vim.optpath = ""..vim.fn.getcwd()..","..vim.fn.getcwd().."/"
vim.opt.conceallevel = 0
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.termguicolors = true
vim.opt.spell = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.breakindent = true              -- maintain indent when wrapping indented lines
vim.opt.list = true                     -- enable the below list chars
vim.opt.listchars = { eol = ' ', tab = '▸ ', trail = '·', nbsp = '␣' }
-- vim.opt.listchars = {  }
-- vim.opt.fillchars:append({ eob = ' ' }) -- remove the ~ from end of buffer
vim.opt.mouse = 'a'                     -- enable mouse for all modes
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.inccommand = 'split'
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = 'unnamedplus' -- Use Linux system clipboard
vim.opt.confirm = true            -- ask for confirmation instead of error
vim.opt.undofile = true           -- persistent undo
vim.opt.swapfile = false
vim.opt.backup = false            -- automatically save a backup file
vim.opt.writebackup = false
vim.opt.backupdir:remove('.')     -- keep backups out of the current directory
-- vim.opt.shortmess:append "c"      -- disable the splash screen
vim.opt.shortmess = 'I'
vim.opt.wildmode =
'longest:full,full'               -- complete the longest common match, and allow tabbing the results to fully complete them
vim.opt.wildignore = { '*.o', '*.a', '__pycache__' }
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert', 'preview' }
vim.opt.signcolumn = 'yes'
vim.opt.showmode = true
vim.opt.updatetime = 100 -- Set update time to 1ms longer than the default to prevent polyglot from changing it

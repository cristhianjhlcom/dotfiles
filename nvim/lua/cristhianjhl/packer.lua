local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use('tpope/vim-fugitive')
  use('tpope/vim-rhubarb')
  use('tpope/vim-sleuth')
  use('tpope/vim-commentary')
  use('tpope/vim-surround')
  use('tpope/vim-repeat')
  use('farmergreg/vim-lastplace')
  use('nelstrom/vim-visual-star-search')
  use('jessarcher/vim-heritage')
  use({
    'sickill/vim-pasta',
    config = function()
        vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
  })
  -- TODO:
  -- Favorite Theme
  use('AlexvZyl/nordic.nvim')
  use('nvim-tree/nvim-web-devicons')
  use('catppuccin/nvim')
  use('tanvirtin/monokai.nvim')
  use('tomasr/molokai')
  use('wuelnerdotexe/vim-enfocado')
  use('theprimeagen/harpoon')
  use('jwalton512/vim-blade')
  use('sts10/vim-mustard')
  -- Mason Server Install.
  use('williamboman/mason.nvim')
  use('jose-elias-alvarez/null-ls.nvim')
  use('jayp0521/mason-null-ls.nvim')
  -- Autocompletion
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('saadparwaiz1/cmp_luasnip')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')
  -- Snippets
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')
  -- LSP Settings
  use({
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
 })
  -- use {
  --     'neovim/nvim-lspconfig',
  --     requires = {
  --         -- LSP Support
  --         {'williamboman/mason.nvim'},
  --         {'williamboman/mason-lspconfig.nvim'},
  --         {'jose-elias-alvarez/null-ls.nvim'},
  --         {'jayp0521/mason-null-ls.nvim'},

  --         -- Autocompletion
  --         {'hrsh7th/nvim-cmp'},
  --         {'hrsh7th/cmp-buffer'},
  --         {'hrsh7th/cmp-path'},
  --         {'saadparwaiz1/cmp_luasnip'},
  --         {'hrsh7th/cmp-nvim-lsp'},
  --         {'hrsh7th/cmp-nvim-lua'},

  --         -- Snippets
  --         {'L3MON4D3/LuaSnip'},
  --         {'rafamadriz/friendly-snippets'},
  --     }
  -- }
  -- Git Settings & Git Signs
  use({
      'lewis6991/gitsigns.nvim',
      requires = 'nvim-lua/plenary.nvim',
  })
  -- Telescope Settings
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    requires = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
    },
  })
  -- Treesitter Settings
  use({
      'nvim-treesitter/nvim-treesitter',
      dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
      build = ':TSUpdate',
  })

  use("nvim-treesitter/playground")


  if packer_bootstrap then
    require('packer').sync()
  end
end)

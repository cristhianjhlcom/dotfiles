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
  use('projekt0n/github-nvim-theme')
  use('AlexvZyl/nordic.nvim')
  use('nvim-tree/nvim-web-devicons')
  use('catppuccin/nvim')
  use('tanvirtin/monokai.nvim')
  use('tomasr/molokai')
  use('wuelnerdotexe/vim-enfocado')
  use('theprimeagen/harpoon')
  use('jwalton512/vim-blade')
  use('sts10/vim-mustard')
  -- Autformat.
  use({
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = {'stylua'},
        python = {'isort', 'black'},
        javascript = {{'prettierd', 'prettier'}},
      },
    },
  })
  -- -- Mason Server Install.
  -- use('williamboman/mason.nvim')
  -- use('williamboman/mason-lspconfig.nvim')
  -- use('WhoIsSethDaniel/mason-tool-installer.nvim')
  -- use('jose-elias-alvarez/null-ls.nvim')
  -- use('jayp0521/mason-null-ls.nvim')
  -- use({'j-hui/fidget.nvim', opts = {}})
  -- use({'folke/neodev.nvim', opts = {}})
  -- -- Snippets
  -- use('L3MON4D3/LuaSnip')
  -- use('rafamadriz/friendly-snippets')
  -- -- Autocompletion
  -- use('hrsh7th/cmp-buffer')
  -- use('hrsh7th/cmp-path')
  -- use('saadparwaiz1/cmp_luasnip')
  -- use('hrsh7th/cmp-nvim-lsp')
  -- use('hrsh7th/cmp-nvim-lua')
  -- use('hrsh7th/nvim-cmp')
  -- -- LSP Settings
  -- use('neovim/nvim-lspconfig')
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
  use('nvim-treesitter/nvim-treesitter-textobjects')
  use({'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'})
  use("nvim-treesitter/playground")
  -- LSP Settings & Tools
  use({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  })
  -- CMP Settings
  use({
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)

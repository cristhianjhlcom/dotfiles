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
      'lukas-reineke/indent-blankline.nvim',
      main = 'ibl',
      opts = {},
  })
  use({
    'famiu/bufdelete.nvim',
    config = function()
        vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
    end,
  })
  use({
    'sickill/vim-pasta',
    config = function()
        vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
  })
  -- TODO:
  -- Favorite Theme
  use({ 'nvim-tree/nvim-web-devicons' })
  use({
      'catppuccin/nvim',
      as = 'catppuccin',
      config = function()
        local status_ok, catppuccin = pcall(require, 'catppuccin')

        if not status_ok then
            print('Error loading catppuccin plugin.')
        end

        catppuccin.setup({
            flavour = 'mocha',
            background = {
                light = 'latte',
                dark = 'mocha',
            },
            transparent_background = true,
            show_end_of_buffer = false,
            term_colors = false,
            no_italic = false,
            no_underline = false,
        })

        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      end,
  })
  use({
    'tanvirtin/monokai.nvim',
    as = 'monokai',
    config = function()
      local status_ok, monokai = pcall(require, 'monokai')
      local palette = {
        base2 = '#202026',
        base3 = '#2E323C',
        white = '#ffffff',
        grey = '#7C7C7C',
        black = '#272822',
        green = '#8DD006',
        yellow = '#E0D561',
        orange = '#fd971f',
        purple = '#9D65FF',
        orange = '#FA8419',
        red = '#F3044B',
        pink = '#F4005F',
        aqua = '#66d9ef',
      }

      if not status_ok then
          print('Error loading monokai plugin.')
      end

      monokai.setup({
        palette = palette,
        italics = false,
        TSInclude = {
            fg = palette.aqua,
        },
        GitSignsAdd = {
            fg = palette.green,
            bg = palette.base2
        },
        GitSignsDelete = {
            fg = palette.pink,
            bg = palette.base2
        },
        GitSignsChange = {
            fg = palette.orange,
            bg = palette.base2
        },
      })
      -- color = color or 'monokai_soda'
      -- vim.cmd.colorscheme(color)
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end
  })
  use('theprimeagen/harpoon')
  -- LSP Settings
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},
          {'jose-elias-alvarez/null-ls.nvim'},
          {'jayp0521/mason-null-ls.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
  }
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
      dependencies = {
          'nvim-treesitter/nvim-treesitter-textobjects',
      },
      build = ':TSUpdate',
  })

  use("nvim-treesitter/playground")


  if packer_bootstrap then
    require('packer').sync()
  end
end)

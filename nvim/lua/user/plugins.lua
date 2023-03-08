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

-- Initialize packer
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = require('packer').use

use('wbthomason/packer.nvim')

use({
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
        vim.cmd('colorscheme catppuccin-mocha')

        -- Hide the characters in FloatBorder
        vim.api.nvim_set_hl(0, 'FloatBorder', {
          fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
          bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
        })

        -- Make the StatusLineNonText background the same as StatusLine
        vim.api.nvim_set_hl(0, 'StatusLineNonText', {
          fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
          bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
        })

        -- Hide the characters in CursorLineBg
        vim.api.nvim_set_hl(0, 'CursorLineBg', {
          fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
          bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
        })

        vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })
    end,
})

-- Commenting support.
use('tpope/vim-commentary')

-- Add, change, and delete surrounding text.
use('tpope/vim-surround')

-- Useful commands like :Rename and :SudoWrite
use('tpope/vim-eunuch')

-- Pairs of handy bracket mappings, like [b and ]b.
use('tpope/vim-unimpaired')

-- Indent autodetection with editorconfig support.
use('tpope/vim-sleuth')

-- Allow plugins to enable repeating of commands.
use('tpope/vim-repeat')

-- Navigate seamlessly between Vim windows and Tmux panes.
use('christoomey/vim-tmux-navigator')

-- Jump to the last location when opening a file.
use('farmergreg/vim-lastplace')

-- Enable * searching with visually selected text.
use('nelstrom/vim-visual-star-search')

-- Automatically create parent dirs when saving
use('jessarcher/vim-heritage')

-- Text objects for HTML attributes.
use({
    'whatyouhide/vim-textobj-xmlattr',
    requires = 'kana/vim-textobj-user',
})

-- Automatically set the working directory to the project root.
use({
    'airblade/vim-rooter',
    setup = function()
        -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
        vim.g.rooter_manual_only = 1
    end,
    config = function()
        vim.cmd('Rooter')
    end,
})

-- Add smooth scrolling to avoid jarring jumps.
use({
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup()
    end,
})

-- All closing buffers without closing the split window.
use({
    'famiu/bufdelete.nvim',
    config = function()
        vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
    end,
})

-- Split arrays and methods onto multiple lines, or join them back up.
use({
    'AndrewRadev/splitjoin.vim',
    config = function()
        vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
        vim.g.splitjoin_trailing_comma = 1
        vim.g.splitjoin_php_method_chain_full = 1
    end,
})

-- Automatically fix indentation when pasting code.
use({
    'sickill/vim-pasta',
    config = function()
        vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
})

-- -- Fuzzy finder.
use({
    'nvim-telescope/telescope.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        'nvim-telescope/telescope-live-grep-args.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = function()
        require('user.plugins.telescope')
    end,
})

--  A status line.
use({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('user.plugins.lualine')
    end,
})

--  Automatically indent blank line.
use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require('user.plugins.indent_blankline')
    end,
})

-- Git integration.
use({
  'lewis6991/gitsigns.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = function()
    require('gitsigns').setup({
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
  end,
})

-- Git commands.
use({
    'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb',
})

-- Toggle Term
use({
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function()
        require('user.plugins.toggleterm')
    end,
})

-- Floating terminal.
-- use({
--     'voldikss/vim-floaterm',
--     config = function()
--         vim.g.floaterm_width = 0.8
--         vim.g.floaterm_height = 0.8
--         -- vim.g.floaterm_wintype = 'split'
--         vim.keymap.set('n', '<F1>', ':FloatermToggle<CR>')
--         vim.keymap.set('t', '<F1>', '<C-\\><C-n>:FloatermToggle<CR>')
--         vim.cmd([[
--             highlight link Floaterm CursorLine
--             highlight link FloatermBorder CursorLineBg
--         ]])
--     end,
-- })

-- Treesitter configurations.
use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,
    requires = {
        'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
        require('user.plugins.treesitter')
    end,
})

-- Language Server Protocol.
use({
    'neovim/nvim-lspconfig',
    requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'b0o/schemastore.nvim',
        'jose-elias-alvarez/null-ls.nvim',
        'jayp0521/mason-null-ls.nvim',
    },
    config = function()
        require('user/plugins/lspconfig')
    end,
})

-- Completion.
use({
    'hrsh7th/nvim-cmp',
    requires = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lua',
        'jessarcher/cmp-path',
        'onsails/lspkind-nvim',
        'saadparwaiz1/cmp_luasnip',
    },
    config = function()
        require('user/plugins/cmp')
    end,
})

-- PHP Refactoring Tools.
use({
    'phpactor/phpactor',
    ft = 'php',
    run = 'composer install --no-dev --optimize-autoloader',
    config = function()
        vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
        vim.keymap.set('n', '<Leader>pn', ':PhpactorClassNew<CR>')
    end,
})

-- Project Configuration.
use({
    'tpope/vim-projectionist',
    requires = 'tpope/vim-dispatch',
    config = function()
        require('user/plugins/projectionist')
    end,
})

-- neovim neotest
use({
  "nvim-neotest/neotest",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "olimorris/neotest-phpunit",
  },
  config = function()
      require('user.plugins.neotest')
  end,
})

-- Testing helper.
-- use({
--     'vim-test/vim-test',
--     config = function()
--         require('user/plugins/vim-test')
--     end,
-- })

-- Automatically install plugins on first run
if packer_bootstrap then
  require('packer').sync()
end

-- Automatically regenerate compiled loader file on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local telescope = require "telescope"
    local builtin = require "telescope.builtin"
    local function map(mode, l, r, opts)
      vim.keymap.set(mode, l, r, opts)
    end

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          '.git/',
          'node_modules/',
          'vendor/',
          'dist/',
          'build/',
          'logs/',
          'storage/logs/',
        },
        color_devicons = true,
        winblend = 1,
        layout_strategy = 'horizontal',
        path_display = { 'truncate' },
        layout_config = {
          preview_cutoff = 0,
          prompt_position = 'top',
          width = 0.95,
          height = 0.95,
          preview_width = 0.65,
        },
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
      },
    })

    map('n', 'gd', builtin.lsp_definitions, { desc = '[G]oto [D]efinitions' })
    map('n', 'gr', builtin.lsp_references, { desc = '[G]oto [R]eferences' })
    map('n', 'gI', builtin.lsp_implementations, { desc = '[G]oto [I]mplementations' })
    map('n', 'D', builtin.lsp_type_definitions, { desc = 'Type [D]efinitions' })
    map('n', 'ds', builtin.lsp_document_symbols, { desc = '[D]ocuments [S]ymbols' })
    map('n', '<Leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    map('n', '<Leader>sg', builtin.git_status, { desc = '[S]earch [G]it Status' })
    map('n', '<Leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
    map('n', '<Leader>sh', builtin.help_tags, { desc = '[S]earch [H]elps' })
    map('n', '<C-p>', builtin.git_files, { desc = 'Search Git Files' })
    map('n', '<Leader>sx', function ()
      builtin.find_files({
        cwd = vim.fn.stdpath('config')
      })
    end, { desc = '[S]earch [X] Neovim Files' })
  end,
}

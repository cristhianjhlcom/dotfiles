return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  event = 'VeryLazy',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
      'lua',
      'luadoc',
      'html',
      'php',
      'css',
      'javascript',
      'typescript',
      'tsx',
      'python',
      'blade',
      'go',
      'rust',
      'c',
      'cpp',
      'phpdoc',
      'query',
      'sql',
      'vim',
      'json',
      'yaml',
      'markdown',
    },
    autotag = {
      enable = true,
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'org' },
    },
    indent = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
        },
      },
    },
  },
  config = function()
    local parsers = require "nvim-treesitter.parsers"
    local parser_configs = parsers.get_parser_configs and parsers.get_parser_configs() or parsers.parser_configs
    if parser_configs then
      parser_configs.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
          generate_requires_npm = true,
          requires_generate_from_grammar = true,
        },
        filetype = "blade"
      }
    end

    vim.filetype.add({
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      }
    })
  end
}

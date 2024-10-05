return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
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
      'python',
    },
    autotag = {
      enable = true,
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
    },
  },
  config = function ()
    local parsers = require("nvim-treesitter.parsers").get_parser_configs()

    ---@diagnostic disable-next-line: inject-field
    parsers.tsx = {
      filetype_to_parsername = { "javascript", "typescript.tsx" },
    }

    ---@diagnostic disable-next-line: inject-field
    parsers.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
        revision = "01e5550cb60ef3532ace0c6df0480f6f406113ff",
      },
      filetype = "blade",
    }
  end
}

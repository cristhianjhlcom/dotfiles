local status_ok, ts = pcall(require, "nvim-treesitter.configs")

if (not status_ok) then return end

ts.setup({
    ensure_installed = {
        'lua',
        'c',
        'typescript',
        'javascript',
        'tsx',
        'python',
        'php',
        'css',
        'html',
        'json',
        'toml',
        'xml',
        'yaml',
        'diff',
        'rust',
    },
    autotag = {
        enable = true,
    },
    sync_install = false,
    auto_install = true,
    ignore_install = { 'vimdoc' },
    indent = {
        enable = true,
        disabled = {},
    },
    highlight = {
        enable = true,
        disable = {},
    },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

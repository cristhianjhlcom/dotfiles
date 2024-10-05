local status_ok, ts = pcall(require, "nvim-treesitter.configs")

if (not status_ok) then
    print("Treesitter error -> "..ts)
    return
end

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
        enable = false,
        disabled = {},
    },
    highlight = {
        enable = true,
        disable = { 'vimdoc'},
        additional_vim_regex_highlighting = true,
    },
})

local parsers = require("nvim-treesitter.parsers").get_parser_configs()

parsers.tsx = {
    filetype_to_parsername = { "javascript", "typescript.tsx" }
}

parsers.blade = {
    install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
        revision =  "01e5550cb60ef3532ace0c6df0480f6f406113ff",
    },
    filetype = "blade",
}

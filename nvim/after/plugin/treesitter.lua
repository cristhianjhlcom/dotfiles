require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'lua',
        'luadoc',
        'c',
        'typescript',
        'javascript',
        'python',
        'tsx',
        'php',
        'css',
        'html',
        'json',
        'rust',
    },
    sync_install = false,
    auto_install = true,
    ignore_install = { 'vimdoc' },
    indent = {
        enable = true,
    },
    highlight = {
        enable = true,
        disable = {},
    },
})

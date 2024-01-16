local status_ok, treesitter = pcall(require, 'nvim-treesitter')

if not status_ok then
    print('Error on nvim treesitter call')
end

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'lua',
        'luadoc',
        'c',
        -- 'vimdoc',
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
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
})

local status_ok, treesitter = pcall(require, 'nvim-treesitter')

if not status_ok then
    print('Error on nvim treesitter call')
end

treesitter.setup({
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
        additional_vim_regex_highlighting = false,
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
})

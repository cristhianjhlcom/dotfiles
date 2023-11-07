local status_ok, treesitter = pcall(require, 'nvim-treesitter')

if not status_ok then
    print('Error on nvim treesitter call')
end

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'lua',
        'vimdoc',
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
    ignore_install = { },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
        enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['if'] = '@function.inner',
          ['af'] = '@function.outer',
          ['ia'] = '@parameter.inner',
          ['aa'] = '@parameter.outer',
        },
      },
    },
})

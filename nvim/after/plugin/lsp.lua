local status_ok, lsp = pcall(require, 'lspconfig')
local mason = require('mason')
local mason_lsp = require('mason-lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local servers = { 'clangd', 'pyright', 'tsserver', 'phpactor', 'html', 'tailwindcss' }

if not status_ok then
    print('Error loading LSP plugin.')
end

local on_attach = function(_, buffer)
    local options = { buffer = buffer }
    vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, options)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, options)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, options)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, options)
    vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<cr>')
    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, options)
    vim.keymap.set('n', '<Leader>vws', function() vim.lsp.buf.workspace_symbol() end, options)
    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, options)
    vim.keymap.set('n', '<Leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, options)
    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, options)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, options)
    vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, options)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, options)
    vim.keymap.set("i", "<A-m>", vim.lsp.buf.completion, { buffer = 0, desc = "Retrieves the completion items at the current cursor." })
    vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format({ async = true }) end, options)
end

mason.setup({
    ui = {
        icons = {
            package_installed = "󰗠",
            package_pending = "",
            package_uninstalled = "",
        },
    },
})

mason_lsp.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

for _, lsp_idx in ipairs(servers) do
    lsp[lsp_idx].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = nil,
        ['<S-Tab'] = nil,
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
})

vim.api.nvim_command('command! Format lua vim.lsp.buf.format()')

vim.diagnostic.config({
    virtual_text = false,
    float = {
        source = false,
    },
})

vim.diagnostic.config({
    virtual_text = true,
})

local status_ok, lsp = pcall(require, 'lsp-zero')

if not status_ok then
    print('Error loading LSP Zero plugin.')
end

lsp.preset('recommended')

lsp.ensure_installed({
    'tailwindcss',
    'pyright',
    'tsserver',
    'html',
})

lsp.nvim_workspace()

local status_cmp_ok, cmp = pcall(require, 'cmp')

if not status_cmp_ok then
    print('Error loading CMP plugin.')
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = ''
    }
})

local options = { buffer = bufnr, remap = false }

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
vim.keymap.set('n', '<Leader>f', function()
    vim.lsp.buf.format({ async = true })
end, options)

lsp.setup()

vim.api.nvim_command('command! Format lua vim.lsp.buf.formatting_seq_sync()')

vim.diagnostic.config({
    virtual_text = false,
    float = {
        source = false,
    },
})

vim.diagnostic.config({
    virtual_text = true,
})

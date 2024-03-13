vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('cristhianjhl-lsp-attach', { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        local builtin = require('telescope.builtin')

        map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
        map('gr', builtin.lsp_references, '[G]oto [R]eferences')
        map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
        map('<Leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
        map('<Leader>ds', builtin.lsp_document_symbols, '[D]ocuments [S]ymbols')
        map('<Leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<Leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<Leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('<Leader>e', vim.diagnostic.open_float, 'Open Float Diagnostic')
        map('[d', vim.diagnostic.goto_prev, '[[][D] Goto Prev')
        map(']d', vim.diagnostic.goto_next, '[]][D] Goto Next')
        map("<A-m>", vim.lsp.buf.completion, 'Retrieves the completion items at the current cursor.')

        -- map('<Leader>q', vim.diagnostic.setloclist)
        -- map('<C-k>', vim.lsp.buf.signature_help, options)
        -- map('<Leader>wa', vim.lsp.buf.add_workspace_folder, options)
        -- map('<Leader>wr', vim.lsp.buf.remove_workspace_folder, options)
        -- map('<Leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, options)
        -- map('<Leader>f', function() vim.lsp.buf.format({ async = true }) end, options)
        --
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

local servers = {
    clangd = {},
    pyright = {},
    tsserver = {},
    phpactor = {},
    html = {},
    tailwindcss = {},
    cssls = {},
    lua_ls = {
        settings = {
            Lua = {
                completion = {
                    callSnippet = 'Replace',
                },
            },
        },
    },
}

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
    'stylua',
})

local status_ok, mason = pcall(require, 'mason')

if not status_ok then
    print('Error loading mason plugin.')
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

require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

require('mason-lspconfig').setup({
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        -- This handles overriding only values explicitly passed
        -- by the server configuration above. Useful when disabling
        -- certain features of an LSP (for example, turning off formatting for tsserver)
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        require('lspconfig')[server_name].setup(server)
      end,
    },
})

vim.api.nvim_command('command! Format lua vim.lsp.buf.format()')


local status_cmp_ok, cmp = pcall(require, 'cmp')
local status_luasnip_ok, luasnip = pcall(require, 'luasnip')

if not status_cmp_ok and not status_luasnip_ok then
    print('Error loading cmp or luasnip plugin.')
end

luasnip.config.setup({})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = { completeopt = 'menu,menuone,noinsert' },
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-y>'] = cmp.mapping.confirm { select = true },
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<C-l>'] = cmp.mapping(function()
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { 'i', 's' }),
    ['<C-h>'] = cmp.mapping(function()
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { 'i', 's' }),
  }),
  source = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
})

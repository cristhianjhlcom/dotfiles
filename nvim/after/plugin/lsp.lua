local status_mason_ok, mason = pcall(require, "mason")
if (not status_mason_ok) then return end

mason.setup()

local servers = {
    clangd = {},
    pyright = {},
    phpactor = {},
    tsserver = {},
    html = {},
    tailwindcss = {},
    cssls = {},
    lua_ls = {},
}

local ensure_installed = vim.tbl_keys(servers or {})
local status_mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if (not status_mason_lspconfig_ok) then return end

mason_lspconfig.setup({
    ensure_installed = ensure_installed,
})

mason.setup({
    ui = {
        icons = {
            package_installed = "󰗠",
            package_pending = "",
            package_uninstalled = "",
        },
    },
})

local on_attach = function(client, bufnr)
    -- Format on Save.
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('Format', { clear = true }),
            buffer = bufnr,
            callback = function(args)
                require('conform').format({ bufnr = args.buf })
                -- vim.lsp.buf.format({
                --     bufnr = bufnr,
                --     async = true,
                -- })
            end,
        })
    end

    local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
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
    map('<Leader>f', function() vim.lsp.buf.format({ async = true }) end, 'Format')
end

for server, _ in pairs(servers) do
    require("lspconfig")[server].setup({
        on_attach = on_attach
    })
end

require("lspconfig").tsserver.setup({
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
})

local _, cmp = pcall(require, "cmp")

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
        ["<C-y>"] = cmp.mapping.confirm({ select = false }),
    }),
    sources = {
        { name = "nvim_lsp" }, -- LSP
        { name = "luasnip" },  -- snippets
        { name = "buffer" },   -- text within the current buffer
        { name = "path" },     -- file system paths
    },
})

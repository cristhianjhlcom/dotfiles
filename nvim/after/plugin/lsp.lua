local status_mason_ok, mason = pcall(require, "mason")

if (not status_mason_ok) then return end

mason.setup({
    ui = {
        icons = {
            package_installed = "󰗠",
            package_pending = "",
            package_uninstalled = "",
        },
    },
})

local servers = {
    bashls = {},
    clangd = {},
    pyright = {},
    intelephense = {
        flags = {
            debounce_text_changes = 150,
        },
        settings = {
            intelephense = {
                files = {
                    maxSize = 5000000,
                },
            },
        },
    },
    phpactor = {
        cmd = { "phpactor", "language-server" },
        filetypes = { "php" },
        root_dir = function (_)
            return vim.loop.cwd()
        end,
        init_options = {
            ["language_server.diagnostics_on_update"] = false,
            ["language_server.diagnostics_on_open"] = false,
            ["lanaguge_server.diagnostics_on_save"] = false,
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
        },
    },
    tsserver = {
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" },
    },
    html = {},
    volar = {},
    svelte = {},
    tailwindcss = {},
    cssls = {},
    lua_ls = {},
    emmet_ls = {},
    jsonls = {},
}

local ensure_installed = vim.tbl_keys(servers or {})
local status_mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if (not status_mason_lspconfig_ok) then return end

mason_lspconfig.setup({
    ensure_installed = ensure_installed,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = function(client, bufnr)
    -- Format on Save.
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

    local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
    end

    local builtin = require('telescope.builtin')

    map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
    -- map('gd', function()
    --     builtin.lsp_definitions({ jump_type = 'vsplit' })
    -- end, '[G]oto [D]efinition')
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
    map('<Leader>f', function()
        require('conform').format({ bufnr = bufnr })
        -- vim.lsp.buf.format({ async = true })
    end, 'Format')
end

for server, config in pairs(servers) do
    require("lspconfig")[server].setup({
        capabilities = capabilities,
        filetypes = config.filetypes,
        on_attach = on_attach,
        settings = config.settings,
    })
end

local _, cmp = pcall(require, "cmp")
local defaults = require("cmp.config.default")()

require("luasnip/loaders/from_vscode").lazy_load()

vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    auto_brackets = {},
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), -- previous suggestion
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), -- next suggestion
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
    experimental = {
        ghost_text = {
            hl_group = "CmpGhostText",
        },
    },
    sorting = defaults.sorting,
})

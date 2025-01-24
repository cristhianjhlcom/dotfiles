return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'saghen/blink.cmp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',
  },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local lsp = require("lspconfig")
    local on_attach = function(_, bufnr)
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP -> ' .. desc })
      end

      map('K', vim.lsp.buf.hover, 'Hover Documentation')
      map('<Leader>rn', vim.lsp.buf.rename, '[R]e[N]ame')
      map('<Leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      map('<Leader>e', vim.diagnostic.open_float, 'Open Float Diagnostic')
      map('[d', vim.diagnostic.goto_prev, '[[][D] Goto Previous')
      map(']d', vim.diagnostic.goto_next, '[[][D] Goto Next')
      map('<Leader>f', function()
        vim.lsp.buf.format({ async = true })
        vim.notify('Formatted successfully')
      end, 'Format buffer')
    end

    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',
        'emmet_ls',
        'phpactor',
        'pyright',
        'clangd',
        'tailwindcss',
        'cssls',
        'ts_ls',
      },
      automatic_installation = false,
    })

    require('neodev').setup()

    lsp.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          telemetry = { enable = false },
          workspace = { checkThirdParty = false },
        },
      },
    })

    lsp.phpactor.setup({
      capabilities = capabilities,
      cmd = { 'phpactor', 'language-server' },
      filetypes = { 'php', 'blade' },
      root_dir = require("lspconfig").util.root_pattern('composer.json', '.git'),
      init_options = {
        ['language_server_phpstan.enabled'] = false,
        ['language_server_psalm.enabled'] = false,
      },
    })

    lsp.ts_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
      },
    })

    lsp.emmet_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "html", "php", "blade" },
    })

    lsp.pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lsp.clangd.setup({
      on_attach = function(client, bufnr)
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP -> ' .. desc })
        end

        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })

          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end

        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('<Leader>rn', vim.lsp.buf.rename, '[R]e[N]ame')
        map('<Leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('<Leader>e', vim.diagnostic.open_float, 'Open Float Diagnostic')
        map('[d', vim.diagnostic.goto_prev, '[[][D] Goto Previous')
        map(']d', vim.diagnostic.goto_next, '[[][D] Goto Next')
        map('<Leader>f', function()
          vim.lsp.buf.format({ async = true })
          vim.notify('Formatted successfully')
        end, 'Format buffer')
      end,
      capabilities = capabilities,
    })

    lsp.html.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lsp.cssls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lsp.tailwindcss.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}

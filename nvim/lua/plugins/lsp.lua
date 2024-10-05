return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',
  },
  config = function()
    local lsp = require "lspconfig"
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
        'emmet_ls',
      },
    })
    require('neodev').setup()
    lsp.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          telemetry = { enable = false },
          workspace = { checkThirdParty = false },
        },
      },
    })
    lsp.emmet_ls.setup({
      on_attach = on_attach,
      filetypes = { "html", "php", "blade" },
    })
  end,
}

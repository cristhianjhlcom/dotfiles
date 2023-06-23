require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- PHP
require('lspconfig').intelephense.setup({ capabilities = capabilities })

-- Vue, JavaScript, TypeScript
require('lspconfig').volar.setup({
  capabilities = capabilities,
  -- Enable "Take Over Mode" where volar will provide all JS/TS LSP Services.
  -- This drastically improves the responsiveness of diagnostic updates on change.
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

-- Tailwind CSS
require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

-- JSON
require('lspconfig').jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

-- null-ls
require('null-ls').setup({
  sources = {
    require('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    require('null-ls').builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.formatting.prettierd,
  },
})

require('mason-null-ls').setup({ automatic_installation = true })

-- Keymaps
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = 0, desc = '[G]o to [D]efinition' })
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { buffer = 0, desc = '[G]o to [D]eclaration' })
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { buffer = 0, desc = 'Type Definition' })
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set("i", "<A-m>", vim.lsp.buf.completion, { buffer = 0, desc = "Retrieves the completion items at the current cursor." })
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = 0, desc = 'Hover Documentation' })
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- Commands.
vim.api.nvim_command('command! Format lua vim.lsp.buf.formatting_seq_sync()')
-- vim.api.nvim_create_user_command('Format', vim.lsp.buf.formatting_seq_sync, {})

-- Diagnostic configurations.
vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  }
})

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

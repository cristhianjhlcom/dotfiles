-- local status_null_ok, null_ls = pcall(require, 'null-ls')

-- if not status_null_ok then
--   print('Error loading null plugin')
-- end

-- null_ls.setup({
--   sources = {
--     null_ls.builtins.diagnostics.eslint_d.with({
--       condition = function(utils)
--         return utils.root_has_file({ '.eslintrc.js', '.eslintrc.cjs' })
--       end,
--     }),
--     null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
--     null_ls.builtins.formatting.eslint_d.with({
--       condition = function(utils)
--         return utils.root_has_file({ '.eslintrc.js', '.eslintrc.cjs' })
--       end,
--     }),
--     null_ls.builtins.formatting.prettierd,
--   },
-- })

-- local status_mason_null_ok, mason_null_ls = pcall(require, 'mason-null-ls')

-- if not status_mason_null_ok then
--   print('Error loading mason null plugin')
-- end

-- mason_null_ls.setup({
--   automatic_installation = true,
-- })

local status_ok, null_ls = pcall(require, "null-ls")

if (not status_ok) then return end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[esling] ${m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.fish
  }
})

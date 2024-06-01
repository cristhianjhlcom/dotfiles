local group = vim.api.nvim_create_augroup("TrailingWhiteSpace", {clear = true})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.cmd("highlight Whitespace guibg=NONE guifg=Gray")
  end,
  desc = "Show trailing white space as red bullets.",
  group = group,
  pattern = { "" },
})


return {
  "wuelnerdotexe/nerdterm",
  config = function ()
    vim.keymap.set("n", "<leader>tt", "<CMD>NERDTermToggle<CR>", { desc = "Open Nerd Terminal" })
    vim.keymap.set("t", "<leader>tt", "<CMD>NERDTermToggle<CR>", { desc = "Open Nerd Terminal" })
  end,
}

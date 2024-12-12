return {
  "Carcuis/darcula.nvim",
  -- "NTBBloodbath/sweetie.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- vim.cmd([[colorscheme sweetie]])
    -- vim.cmd([[set background=light]])

    vim.cmd([[colorscheme darcula]])
    vim.cmd([[set background=dark]])
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
}

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

    vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
    vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
    vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
    vim.cmd("hi WinBar guibg=NONE ctermbg=NONE")
  end,
}

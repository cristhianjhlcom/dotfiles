return {
    "NTBBloodbath/sweetie.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme sweetie]])
        vim.cmd([[set background=light]])
    end,
}

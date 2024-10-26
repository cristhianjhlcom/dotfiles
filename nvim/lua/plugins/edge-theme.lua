return {
    "sainnhe/edge",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme edge]])
        vim.cmd([[set background=light]])
    end,
}

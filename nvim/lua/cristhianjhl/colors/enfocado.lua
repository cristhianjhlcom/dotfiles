local function setup()
    vim.g.enfocado_style = 'neon'
    vim.cmd.colorscheme('enfocado')
end

return {
    setup = setup,
}

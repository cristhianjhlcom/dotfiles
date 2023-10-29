local status_ok, catppuccin = pcall(require, 'catppuccin')

if not status_ok then
    print('Error loading catppuccin plugin.')
    return
end

local function setup()
    catppuccin.setup({
        flavour = 'mocha',
        background = {
            light = 'latte',
            dark = 'mocha',
        },
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = true,
        no_italic = true,
        no_underline = false,
        integrations = {
            gitsigns = true,
            treesitter = true,
        },
    })
    vim.cmd.colorscheme('catppuccin')
end

return {
    setup = setup,
}

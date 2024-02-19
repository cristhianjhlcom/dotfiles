local status_ok, github = pcall(require, 'github-theme')

if not status_ok then
    print('Error loading github plugin.')
end

local function setup(bg)
    colorscheme = 'github_light'
    github.setup({
        options = {
            transparent = true,
            styles = {
                comments = 'italic',
                keywords = 'bold',
                types = 'bold',
            },
        },
        -- override = {
        --     Visual = {
        --         fg = palette.black0,
        --         bg = palette.yellow.base,
        --         italic = true,
        --         bold = true,
        --     },
        --     StatusLine = {
        --         fg = palette.black2,
        --         bg = palette.orange.dim,
        --         italic = true,
        --         bold = true,
        --     },
        --     LineNrAbove = {
        --         fg = palette.gray2,
        --         bg = nil,
        --         italic = false,
        --         bold = false,
        --     },
        --     LineNrBelow = {
        --         fg = palette.gray2,
        --         bg = nil,
        --         italic = false,
        --         bold = false,
        --     },
        --     StatusLineNC = {
        --         fg = palette.orange.dim,
        --         italic = true,
        --     },
        --     LineNr = {
        --         fg = palette.orange.dim,
        --         bg = nil,
        --         bold = true,
        --     },
        -- }
    })

    vim.cmd.colorscheme(colorscheme)
end

return {
    setup = setup,
}

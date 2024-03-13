local status_ok, github = pcall(require, 'github-theme')

if not status_ok then
    print('Error loading github plugin.')
end

local function setup()
    colorscheme = 'github_light'
    github.setup({
        options = {
            transparent = true,
            styles = {
                functions = 'bold',
                variables = 'bold',
                comments = 'italic',
                keywords = 'bold',
                types = 'bold',
            },
        },
        override = {
            LineNrAbove = {
                fg = Gray,
                bg = nil,
                italic = false,
                bold = false,
            },
            LineNrBelow = {
                fg = Gray,
                bg = nil,
                italic = false,
                bold = false,
            },
            LineNr = {
                fg = Red,
                bg = nil,
                bold = true,
            },
        }
    })

    vim.cmd.colorscheme(colorscheme)
end

return {
    setup = setup,
}

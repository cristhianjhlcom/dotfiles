local status_ok, github = pcall(require, 'github-theme')

if not status_ok then
    print('Error loading github plugin.')
end

local function setup()
    local colorscheme = 'github_dark'
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
                fg = 'Gray',
                bg = nil,
                italic = false,
                bold = false,
            },
            LineNrBelow = {
                fg = 'Gray',
                bg = nil,
                italic = false,
                bold = false,
            },
            LineNr = {
                fg = 'Gray',
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

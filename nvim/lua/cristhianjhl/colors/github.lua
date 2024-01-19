local status_ok, github = pcall(require, 'github-theme')

if not status_ok then
    print('Error loading github plugin.')
end

local function setup(bg)
    colorscheme = bg and 'github_dark_dimmed' or 'github_light'
    github.setup({
        options = {
            transparent = true,
            styles = {
                comments = 'italic',
                keywords = 'bold',
                types = 'bold',
            },
        },
    })

    vim.cmd.colorscheme(colorscheme)
end

return {
    setup = setup,
}

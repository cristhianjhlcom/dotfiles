-- local status_ok, molokai = pcall(require, 'molokai')

-- if not status_ok then
--     print('Error loading molokai plugin.')
-- end

local function setup()
    vim.cmd([[
        set background=dark
    ]])
    vim.cmd.colorscheme('mustard')
end

return {
    setup = setup,
}

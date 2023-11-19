-- local status_ok, molokai = pcall(require, 'molokai')

-- if not status_ok then
--     print('Error loading molokai plugin.')
-- end

local function setup()
    vim.g.molokai_original = 1
    vim.g.rehash256 = 1
    vim.g.italics = false
    vim.g.italic_keywords = false
    vim.g.italic_functions = false
    vim.cmd.colorscheme('molokai')
end

return {
    setup = setup,
}

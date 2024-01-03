-- local status_ok, molokai = pcall(require, 'molokai')

-- if not status_ok then
--     print('Error loading molokai plugin.')
-- end

local function setup()
    vim.g.molokai_original = 1
    vim.g.rehash256 = 1

    vim.g.italics = 0
    vim.g.italics_comments = 0
    vim.g.italic_keywords = 0
    vim.g.italic_functions = 0

    vim.cmd([[
        hi! link Italic Normal
        hi Normal guibg=NONE ctermbg=NONE
        hi LineNr guibg=NONE ctermbg=NONE
        hi LineNr guifg=#BCBCBC guibg=NONE ctermbg=NONE
        hi SignColumn guibg=NONE ctermbg=NONE
        hi DiffText guibg=#4C4745 gui=bold
        hi Label guifg=#E6DB74 gui=bold
        hi Macro guifg=#C4BE89 gui=bold
        hi SpecialKey guifg=#66D9EF gui=bold
    ]])

    vim.cmd.colorscheme('molokai')
end

return {
    setup = setup,
}

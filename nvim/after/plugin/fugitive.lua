vim.keymap.set('n', '<Leader>ggs', vim.cmd.Git)

local cristhian_fugitive = vim.api.nvim_create_augroup('Cristhian_Fugitive', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWinEnter', {
  group = cristhian_fugitive,
  pattern = '*',
  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "<Leader>ggp", function()
      vim.cmd.Git('push')
    end, opts)

    -- rebase always
    vim.keymap.set("n", "<Leader>ggpl", function()
      vim.cmd.Git({'pull',  '--rebase'})
    end, opts)

    -- NOTE: It allows me to easily set the branch i am pushing and any tracking
    -- needed if i did not set the branch up correctly
    vim.keymap.set("n", "<Leader>ggpu", ":Git push -u origin ", opts);
  end
})

return {
  "akinsho/toggleterm.nvim",
  config = function()
    local term = require "toggleterm"
    local Terminal = require "toggleterm.terminal".Terminal

    term.setup({
      size = 10,
      open_mapping = "<leader>`",
      shade_terminals = true,
      direction = "horizontal",
    })

    local function create_terminal(cmd)
      return Terminal:new({
        cmd = cmd,
        hidden = true,
      })
    end

    local make_default = create_terminal("make")
    local make_clean = create_terminal("make clean")
    local make_run = create_terminal("make run")

    vim.cmd([[
      set makeprg=make
      set errorformat=%f:%l:%m
    ]])

    vim.keymap.set("n", "<leader>m", function()
      make_default:toggle()
    end, { desc = "Run Makefile default command and open terminal" })
    vim.keymap.set("n", "<leader>mc", function()
      make_clean:toggle()
    end, { desc = "Run Makefile clean command and open terminal" })
    vim.keymap.set("n", "<leader>mr", function()
      make_run:toggle()
    end, { desc = "Run Makefile run command and open terminal" })
  end,
}

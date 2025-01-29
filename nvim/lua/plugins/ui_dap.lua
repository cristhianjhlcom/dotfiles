return {
  "rcarriga/nvim-dap-ui",
  event = 'VeryLazy',
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      layouts = {
        {
          elements = {
            { id = "scopes",      size = 0.3 },
            { id = "breakpoints", size = 0.3 },
            { id = "stacks",      size = 0.2 },
            { id = "watches",     size = 0.2 },
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            { id = "repl",    size = 0.5 },
            { id = "console", size = 0.5 },
          },
          size = 10,
          position = "bottom",
        },
      },
    })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>", {
      desc = "Add breakpoint at line"
    })

    vim.keymap.set("n", "<leader>dr", "<cmd> DapContinue <cr>", {
      desc = "Start or continue the debugger"
    })
  end,
}

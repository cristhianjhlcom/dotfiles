return {
  "rcarriga/nvim-dap-ui",
  event = 'VeryLazy',
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },
  config = function ()
    local dap = require("dap")
    local dapui = require("dapui")

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

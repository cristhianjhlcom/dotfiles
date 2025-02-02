local map = function(mode, shortcut, cmd, options)
  vim.keymap.set(mode, shortcut, cmd, options or {})
end

return {
  "rcarriga/nvim-dap-ui",
  event = 'VeryLazy',
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    -- "theHamsta/nvim-dap-virtual-text"
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"
    -- local virtual_text = require "nvim-dap-virtual-text"

    -- dap.adapters.gdb = {
    --   type = "executable",
    --   command = "/usr/bin/gdb",
    --   args = { "-i", "dap" }
    -- }
    --
    -- dap.configurations.c = {
    --   {
    --     name = "GDB Launch",
    --     type = "gdb",
    --     request = "launch",
    --     program = function()
    --       return vim.fn.input("Executable ", vim.fn.getcwd() .. "/", "file")
    --     end,
    --     cwd = "${workspaceFolder}",
    --     stopOnEntry = false,
    --     args = {},
    --   },
    -- }

    dapui.setup()

    dap.listeners.after.event_initialized.dapui_config = function()
      dapui.open()
    end

    -- dap.listeners.before.attach.dapui_config = function()
    --   dapui.open()
    -- end

    -- dap.listeners.before.launch.dapui_config = function()
    --   dapui.open()
    -- end

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    map("n", "<F5>", function() dap.continue() end)
    map("n", "<F10>", function() dap.step_over() end)
    map("n", "<F11>", function() dap.step_into() end)
    map("n", "<F12>", function() dap.step_out() end)
    map("n", "<leader>b", function() dap.toggle_breakpoint() end)
    map("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
    map("n", "<leader>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    map("n", "<leader>dr", function() dap.repl.open() end)
    map("n", "<leader>dl", function() dap.run_last() end)
  end,
}

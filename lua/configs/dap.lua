local M = {}

M.config = function()
  dofile(vim.g.base46_cache .. "dap")
  local dap = require "dap"
  local dapui = require "dapui"

  local mason = vim.fn.expand "$XDG_DATA_HOME" .. "/nvim/mason/packages"
  local cppdbg = mason .. "/cpptools/extension/debugAdapters/bin/OpenDebugAD7"

  dap.adapters.cpptools = {
    id = "cppdbg",
    type = "executable",
    command = cppdbg,
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "cppdbg",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopAtEntry = true,
    },
    {
      name = "Attach to gdbserver :1234",
      type = "cppdbg",
      request = "launch",
      MIMode = "gdb",
      miDebuggerServerAddress = "localhost:1234",
      miDebuggerPath = "/usr/bin/gdb",
      cwd = "${workspaceFolder}",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
    },
  }

  dap.configurations.c = dap.configurations.cpp

  dapui.setup()

  dap.listeners.after.attach.dapui_config = function()
    dapui.open()
  end

  dap.listeners.after.launch.dapui_config = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end

  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end
end

return M

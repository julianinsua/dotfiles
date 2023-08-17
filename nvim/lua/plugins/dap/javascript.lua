local dap = require('dap')
local dap_vscode = require("dap-vscode-js")
local dap_utils = require("dap.utils")

local M = {}

-- vim.fn.stdpath("data") is normally /home/<username>/.local/share/nvim/
local DEBUGGER_PATH = vim.fn.stdpath 'data' .. "/lazy/vscode-js-debug"

M.setup = function()
  dap_vscode.setup({
    debugger_path = DEBUGGER_PATH,                                                               -- Path to vscode-js-debug installation.
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  })

  for _, language in ipairs({ "typescript", "javascript" }) do
    dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = dap_utils.pick_process,
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug Jest Tests",
        -- trace = true, -- include debugger info
        runtimeExecutable = "node",
        runtimeArgs = {
          "./node_modules/jest/bin/jest.js",
          "--runInBand",
        },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      }
    }
  end
end

return M

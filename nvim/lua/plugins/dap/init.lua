local dap, dapui = require("dap"), require("dapui")

local M = {}


local function configure()
  local dapBreakpoint = {
    point = {
      text = '',
      texthl = 'LspDiagnosticsSignError',
      linehl = '',
      numhl = '',
    },
    rejected = {
      text = '',
      texthl = 'LspDiagnosticsSignHint',
      linehl = '',
      numhl = '',
    },
    stopped = {
      text = '',
      texthl = 'LspDiagnosticsSignInformation',
      linehl = 'DiagnosticUnderlineInfo',
      numhl = 'LspDiagnosticsSignInformation',
    },
  }

  vim.fn.sign_define('DapBreakpoint', dapBreakpoint.point)
  vim.fn.sign_define('DapStopped', dapBreakpoint.stopped)
  vim.fn.sign_define('DapBreakpointRejected', dapBreakpoint.rejected)
end

local function configure_exts()
  require("nvim-dap-virtual-text").setup {
    commented = true,
  }

  dapui.setup {}
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

local function configure_debuggers()
  require("plugins.dap.javascript").setup()
  require("plugins.dap.go").setup()
end

local function configure_keybindings()
  -- vim.keymap.set('n', '<leader>dh', dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
  -- vim.keymap.set('n', '<S-k>', dap.step_out, { desc = "Step out" })
  -- vim.keymap.set('n', '<S-l>', dap.step_into, { desc = "Step into" })
  -- vim.keymap.set('n', '<S-j>', dap.step_over, { desc = "Step over" })
  -- vim.keymap.set('n', '<leader>dn', dap.continue, { desc = "Debugger continue" })
  -- vim.keymap.set('n', '<leader>da', require('debugHelper').attach)

  vim.keymap.set("n", "<leader>dr", function() dap.run_to_cursor() end, { desc = "[DAP] Run to Cursor" })
  vim.keymap.set("n", "<leader>dE", function() dapui.eval(vim.fn.input "[Expression] > ") end,
    { desc = "[DAP] Evaluate Input" })
  vim.keymap.set("n", "<leader>dC", function() dap.set_breakpoint(vim.fn.input "[Condition] > ") end,
    { desc = "[DAP] Conditional Breakpoint" })
  vim.keymap.set("n", "<leader>dU", function() dapui.toggle() end, { desc = "[DAP] Toggle dap UI" })
  vim.keymap.set("n", "<leader>dk", function() dap.step_back() end, { desc = "[DAP] Step Back" })
  vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "[DAP] Continue" })
  vim.keymap.set("n", "<leader>dd", function() dap.disconnect() end, { desc = "[DAP] Disconnect" })
  vim.keymap.set("n", "<leader>de", function() dapui.eval() end, { desc = "[DAP] Evaluate" })
  vim.keymap.set("v", "<leader>de", function() dapui.eval() end, { desc = "[DAP] Evaluate" })
  vim.keymap.set("n", "<leader>dg", function() dap.session() end, { desc = "[DAP] Get Session" })
  vim.keymap.set("n", "<leader>dH", function() require("dap.ui.widgets").hover() end, { desc = "[DAP] Hover Variables" })
  vim.keymap.set("n", "<leader>dS", function() require("dap.ui.widgets").scopes() end, { desc = "[DAP] Scopes" })
  vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "[DAP] Step Into" })
  vim.keymap.set("n", "<leader>do", function() dap.step_over() end, { desc = "[DAP] Step Over" })
  vim.keymap.set("n", "<leader>dp", function() dap.pause.toggle() end, { desc = "[DAP] Pause" })
  vim.keymap.set("n", "<leader>dq", function() dap.close() end, { desc = "[DAP] Quit" })
  vim.keymap.set("n", "<leader>dR", function() dap.repl.toggle() end, { desc = "[DAP] Toggle REPL" })
  vim.keymap.set("n", "<leader>ds", function() dap.continue() end, { desc = "[DAP] Start" })
  vim.keymap.set("n", "<leader>dh", function() dap.toggle_breakpoint() end, { desc = "[DAP] Toggle Breakpoint" })
  vim.keymap.set("n", "<leader>dx", function() dap.terminate() end, { desc = "[DAP] Terminate" })
  vim.keymap.set("n", "<leader>du", function() dap.step_out() end, { desc = "[DAP] Step Out" })
end

M.setup = function()
  configure()
  configure_exts()
  configure_debuggers()
  configure_keybindings()
end



return M

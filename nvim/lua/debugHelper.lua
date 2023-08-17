local dap = require('dap')

local function debugJest(testName, fileName)
	dap.run({
		type = 'node2',
		request = 'launch',
		cwd = vim.fn.getcwd(),
		runtimeArgs = { '--inspect-brk', '/usr/local/bin/jest', '--no-coverage', '-t', testName, '--', fileName },
		sourceMaps = true,
		protocol = 'inspector',
		skipFiles = { '<node_internals>/**/*.js' },
		console = 'integratedTerminal',
		port = 9229,
	})
end

local function attach()
	print("attaching")
	dap.run({
		type = 'node2',
		request = 'attach',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		skipFiles = { '<node_internals>/**/*.js' }
	})
end

return {
	debugJest = debugJest,
	attach = attach
}

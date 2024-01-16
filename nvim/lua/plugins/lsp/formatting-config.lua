local conform = require("conform")

vim.keymap.set({ "n", "v" }, "<leader>P", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 15000,
	})
end, { desc = "Apply formatting file or range using conform" })

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- JS / TS / HTML / CSS
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint_d,

				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,

				-- C / C++
				null_ls.builtins.formatting.clang_format,
			},
		})

		vim.keymap.set("n", "<C-i>", vim.lsp.buf.format, {})
		vim.keymap.set("i", "<C-i>", vim.lsp.buf.format, {})
	end,
}

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"eslint",
					"tailwindcss",
					"clangd",
					"pyright",
					"yamlls",
					"dockerls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
		config = function()
			local lsp = require("lsp-zero").preset({})

			lsp.ensure_installed({
				"lua_ls",
				"ts_ls",
				"eslint",
				"tailwindcss",
				"clangd",
				"pyright",
				"yamlls",
				"dockerls",
			})

			vim.lsp.config("pyright", {
				settings = {
					python = {
						venvPath = ".",
						venv = ".venv",
					},
				},
			})

			lsp.on_attach(function(client, bufnr)
				local opts = {
					buffer = bufnr,
					noremap = true,
					silent = true,
				}
				vim.keymap.set("n", "<C-n>", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<C-d>", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<C-a>", vim.lsp.buf.code_action, opts)
        vim.keymap.set("i", "<C-n>", vim.lsp.buf.hover, opts)
				vim.keymap.set("i", "<C-d>", vim.lsp.buf.definition, opts)
				vim.keymap.set("i", "<C-a>", vim.lsp.buf.code_action, opts)
			end)

			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = true,
				signs = true,
				underline = true,
				update_in_insert = true,
				severity_sort = true,
				float = {
					border = "rounded",
					source = "always",
				},
			})

			lsp.setup()
		end,
	},
}

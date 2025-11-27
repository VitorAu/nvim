return {
	-- Mason
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSP installer
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver", -- FIXED
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

	-- LSP Zero
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lsp = require("lsp-zero").preset({})

			lsp.ensure_installed({
				"lua_ls",
				"tsserver",
				"eslint",
				"tailwindcss",
				"clangd",
				"pyright",
				"yamlls",
				"dockerls",
			})

			-- Pyright venv settings
			vim.lsp.config("pyright", {
				settings = {
					python = { venvPath = ".", venv = ".venv" },
				},
			})

			-- Keymaps
			lsp.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr, silent = true, noremap = true }

				vim.keymap.set("n", "<C-n>", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<C-d>", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<C-a>", vim.lsp.buf.code_action, opts)

				vim.keymap.set("i", "<C-n>", vim.lsp.buf.hover, opts)
				vim.keymap.set("i", "<C-d>", vim.lsp.buf.definition, opts)
				vim.keymap.set("i", "<C-a>", vim.lsp.buf.code_action, opts)
			end)

			-- Diagnostics
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
	{
		"p00f/clangd_extensions.nvim",
		config = function()
			require("clangd_extensions").setup({
				inlay_hints = { inline = true },
			})
		end,
	},
}

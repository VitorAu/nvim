return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
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
                automatic_installation = true
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -----------------------------------------------------------------------
            -- C / C++
            -----------------------------------------------------------------------
            vim.lsp.config("clangd", {
                cmd = { "clangd", "--background-index", "--clang-tidy" },
            })
            vim.lsp.enable("clangd")

            -----------------------------------------------------------------------
            -- Python
            -----------------------------------------------------------------------
            vim.lsp.config("pyright", {
                settings = {
                    python = {
                        venvPath = ".",
                        venv = ".venv",
                    },
                },
            })
            vim.lsp.enable("pyright")

            -----------------------------------------------------------------------
            -- Lua
            -----------------------------------------------------------------------
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
            vim.lsp.enable("lua_ls")

            -----------------------------------------------------------------------
            -- TypeScript / JavaScript
            -----------------------------------------------------------------------
            vim.lsp.config("ts_ls", {
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
                end,
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayVariableTypeHints = true,
                        },
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                        },
                    },
                },
            })
            vim.lsp.enable("ts_ls")

            -----------------------------------------------------------------------
            -- ESLint
            -----------------------------------------------------------------------
            vim.lsp.config("eslint", {
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = true
                end,
            })
            vim.lsp.enable("eslint")

            -----------------------------------------------------------------------
            -- Diagnostics
            -----------------------------------------------------------------------
            vim.diagnostic.config({
                virtual_text = false,
                virtual_lines = false,
                underline = true,
                severity_sort = true,
                float = false,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN]  = " ",
                        [vim.diagnostic.severity.HINT]  = "󰌵 ",
                        [vim.diagnostic.severity.INFO]  = " ",
                    },
                },
            })
        end
    }
}

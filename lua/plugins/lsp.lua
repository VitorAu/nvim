return {{
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()
    end
}, {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {"lua_ls", "ts_ls", "eslint", "tailwindcss", "clangd", "pyright", "yamlls", "dockerls"},
            automatic_installation = true
        })
    end
}, {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {"neovim/nvim-lspconfig", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim"},
    config = function()
        local lsp = require("lsp-zero").preset({})

        lsp.ensure_installed({"lua_ls", "ts_ls", "eslint", "tailwindcss", "clangd", "pyright", "yamlls", "dockerls"})
        vim.lsp.config("pyright", {
            settings = {
                python = {
                    venvPath = ".",
                    venv = ".venv"
                }
            }
        })
        local signs = {
            Error = " ",
            Warn = " ",
            Hint = "󰌵 ",
            Info = " "
        }

        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, {
                text = icon,
                texthl = hl,
                numhl = ""
            })
        end

        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = false,
            signs = true,
            underline = true,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "always",
                wrap = true
            }
        })

        lsp.setup()
    end
}}

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false
                },
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true
            },
            enable_diagnostics = true,
            default_component_configs = {
                diagnostics = {
                    symbols = {
                        hint = "󰌵",
                        info = "",
                        warn = "",
                        error = ""
                    },
                    highlights = {
                        hint = "DiagnosticHint",
                        info = "DiagnosticInfo",
                        warn = "DiagnosticWarn",
                        error = "DiagnosticError"
                    }
                }
            },
            window = {
                mappings = {
                    ["<C-b>"] = "close_window"
                }
            }
        })
    end,
    lazy = false
}

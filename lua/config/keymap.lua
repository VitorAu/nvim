local opts = { noremap = true, silent = true }

-----------------------------------------------------------------------
-- Leader Key
-----------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------------------------------------------------------------
-- Clipboard
-----------------------------------------------------------------------
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("v", "<C-x>", '"+d', { desc = "Cut to system clipboard" })
vim.keymap.set({ "n", "v" }, "<C-v>", '"+p', { desc = "Paste from system clipboard" })

-----------------------------------------------------------------------
-- Window Navigation
-----------------------------------------------------------------------
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to lower split" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to upper split" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to right split" })
vim.keymap.set("n", "<leader><", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<leader>>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<leader>+", ":resize +2<CR>", opts)
vim.keymap.set("n", "<leader>-", ":resize -2<CR>", opts)

-----------------------------------------------------------------------
-- Commenting
-----------------------------------------------------------------------
vim.keymap.set("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
end, opts)
vim.keymap.set("v", "<leader>/", function()
    require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, opts)

-----------------------------------------------------------------------
-- LSP Keymaps
-----------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local b = { buffer = event.buf, silent = true, noremap = true }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, b)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, b)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, b)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, b)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, b)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, b)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, b)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, b)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, b)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, b)
    end,
})

-----------------------------------------------------------------------
-- Neotree Explorer
-----------------------------------------------------------------------
vim.keymap.set("n", "<leader>e", ":Neotree toggle left<CR>", opts)

-----------------------------------------------------------------------
-- Formatting
-----------------------------------------------------------------------
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })

-----------------------------------------------------------------------
-- Telescope
-----------------------------------------------------------------------
vim.keymap.set("n", "<leader>ff", function()
    require("telescope.builtin").find_files()
end, { desc = "Find files in project" })
vim.keymap.set("n", "<leader>fg", function()
    require("telescope.builtin").live_grep()
end, { desc = "Find text in project" })
vim.keymap.set("n", "<leader>fb", function()
    require("telescope.builtin").buffers()
end, { desc = "Find buffers in project" })
vim.keymap.set("n", "<leader>fp", function()
    require("telescope.builtin").commands()
end, { desc = "Command palette" })

-----------------------------------------------------------------------
-- ToggleTerm
-----------------------------------------------------------------------
local function toggle_term(id)
    local Terminal = require("toggleterm.terminal").Terminal
    Terminal:new({ id = id, direction = "float" }):toggle()
end

vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=float<CR>", opts)
vim.keymap.set("n", "<leader>t1", function() toggle_term(1) end, opts)
vim.keymap.set("n", "<leader>t2", function() toggle_term(2) end, opts)
vim.keymap.set("n", "<leader>t3", function() toggle_term(3) end, opts)
vim.keymap.set("n", "<leader>t4", function() toggle_term(4) end, opts)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

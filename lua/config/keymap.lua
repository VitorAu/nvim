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
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })

-----------------------------------------------------------------------
-- Window Navigation
-----------------------------------------------------------------------
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
vim.keymap.set("n", "<C-<>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C->>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-+>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-->", ":resize -2<CR>", opts)

-----------------------------------------------------------------------
-- Commenting
-----------------------------------------------------------------------
vim.keymap.set("n", "<C-_>", function()
    require("Comment.api").toggle.linewise.current()
end, opts)
vim.keymap.set("v", "<C-_>", function()
    local api = require("Comment.api")
    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
    vim.api.nvim_feedkeys(esc, "nx", false)
    api.toggle.linewise(vim.fn.visualmode())
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
        vim.keymap.set("n", "rn", vim.lsp.buf.rename, b)
        vim.keymap.set("n", "ca", vim.lsp.buf.code_action, b)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, b)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, b)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, b)
        vim.keymap.set("n", "e", vim.diagnostic.open_float)
    end,
})

-----------------------------------------------------------------------
-- Neotree Explorer
-----------------------------------------------------------------------
vim.keymap.set("n", "<C-b>", ":Neotree toggle left<CR>", opts)

-----------------------------------------------------------------------
-- Formatting
-----------------------------------------------------------------------
vim.keymap.set("n", "<C-i>", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })

-----------------------------------------------------------------------
-- Telescope
-----------------------------------------------------------------------
vim.keymap.set("n", "ff", function()
    require("telescope.builtin").find_files(
        require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
        })
    )
end, { desc = "Find files in project" })
vim.keymap.set("n", "fg", function()
    require("telescope.builtin").live_grep(
        require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
        })
    )
end, { desc = "Find text in project" })
vim.keymap.set("n", "<C-f>", function()
    require("telescope.builtin").current_buffer_fuzzy_find(
        require("telescope.themes").get_dropdown({
            sorting_strategy = "ascending",
            previewer = false,
        })
    )
end, { desc = "Fuzzy search in current file" })
vim.keymap.set("n", "fb", function()
    require("telescope.builtin").buffers(
        require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
        })
    )
end, { desc = "Find buffers in project" })
vim.keymap.set("n", "fp", function()
    require("telescope.builtin").commands(
        require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
        })
    )
end, { desc = "Command palette" })

-----------------------------------------------------------------------
-- ToggleTerm
-----------------------------------------------------------------------
local function toggle_term(id)
    local Terminal = require("toggleterm.terminal").Terminal
    Terminal:new({ id = id, direction = "float" }):toggle()
end
vim.keymap.set("n", "tt", ":ToggleTerm direction=float<CR>", opts)
vim.keymap.set("n", "th", function() toggle_term(1) end, opts)
vim.keymap.set("n", "tj", function() toggle_term(2) end, opts)
vim.keymap.set("n", "tk", function() toggle_term(3) end, opts)
vim.keymap.set("n", "tl", function() toggle_term(4) end, opts)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

-----------------------------------------------------------------------
-- Search / UI Behavior
-----------------------------------------------------------------------
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "Clear search highlight" })

-----------------------------------------------------------------------
-- Discipline
-----------------------------------------------------------------------
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

local telescope = require("telescope.builtin")
local opts = { noremap = true, silent = true }

-----------------------------------------------------------------------
-- Clipboard
-----------------------------------------------------------------------
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<C-v>", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<C-x>", '"+d', { desc = "Cut to system clipboard" })

-----------------------------------------------------------------------
-- Window navigation
-----------------------------------------------------------------------
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to bottom split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to top split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

-----------------------------------------------------------------------
-- Comment API
-----------------------------------------------------------------------
vim.keymap.set("n", "gc", function()
	require("Comment.api").toggle.linewise.current()
end, opts)
vim.keymap.set("v", "gc", function()
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, opts)

-----------------------------------------------------------------------
-- LSP
-----------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local buf = event.buf
		local b = { buffer = buf, silent = true, noremap = true }
		vim.keymap.set("n", "<C-n>", vim.lsp.buf.hover, b)
		vim.keymap.set("n", "<C-d>", vim.lsp.buf.definition, b)
		vim.keymap.set("n", "<C-a>", vim.lsp.buf.code_action, b)
		vim.keymap.set("i", "<C-n>", vim.lsp.buf.hover, b)
		vim.keymap.set("i", "<C-d>", vim.lsp.buf.definition, b)
		vim.keymap.set("i", "<C-a>", vim.lsp.buf.code_action, b)
	end,
})

-----------------------------------------------------------------------
-- Neotree
-----------------------------------------------------------------------
vim.keymap.set("n", "<C-b>", ":Neotree toggle left show<CR>", opts)
vim.keymap.set("i", "<C-b>", "<Esc>:Neotree toggle left show<CR>", opts)

-----------------------------------------------------------------------
-- Format
-----------------------------------------------------------------------
vim.keymap.set("n", "<C-i>", function()
	vim.lsp.buf.format()
end, opts)
vim.keymap.set("i", "<C-i>", function()
	vim.cmd("stopinsert")
	vim.lsp.buf.format()
end, opts)

-----------------------------------------------------------------------
-- Telescope
-----------------------------------------------------------------------
vim.keymap.set("n", "<C-p>", telescope.find_files, { desc = "Find files in project" })
vim.keymap.set("n", "<C-f>", telescope.live_grep, { desc = "Find text in project" })

-----------------------------------------------------------------------
-- ToggleTerm
-----------------------------------------------------------------------
vim.keymap.set("n", "th", function()
	toggle_term(1)
end, opts)
vim.keymap.set("n", "tj", function()
	toggle_term(2)
end, opts)
vim.keymap.set("n", "tk", function()
	toggle_term(3)
end, opts)
vim.keymap.set("n", "tl", function()
	toggle_term(4)
end, opts)
vim.keymap.set("n", "tt", ":ToggleTerm<CR>", opts)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

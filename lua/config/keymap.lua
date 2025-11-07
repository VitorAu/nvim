vim.keymap.set("v", "<C-c>", '"+y', {
	desc = "Copy to system clipboard",
})
vim.keymap.set({ "n", "v" }, "<C-v>", '"+p', {
	desc = "Paste from system clipboard",
})
vim.keymap.set("v", "<C-x>", '"+d', {
	desc = "Cut to system clipboard",
})
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to bottom split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to top split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

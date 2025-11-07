vim.keymap.set("v", "<C-c>", '"+y', {
    desc = "Copy to system clipboard",
})
vim.keymap.set({ "n", "v" }, "<C-v>", '"+p', {
    desc = "Paste from system clipboard",
})
vim.keymap.set("v", "<C-x>", '"+d', {
    desc = "Cut to system clipboard",
})

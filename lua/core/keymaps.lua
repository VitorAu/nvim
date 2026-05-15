local keymap = vim.keymap.set
local command = vim.api.nvim_create_user_command
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

----------------------------------------------------------------------
--- Pack
----------------------------------------------------------------------
command("PackInstall",
  function(aux)
    vim.pack.add({ src = opts.args })
  end, { nargs = 1, desc = "Install package" }
)
command("PackUpdate",
  function()
    vim.pack.update()
  end, { desc = "Update packages" }
)
command("PackUninstall",
  function(aux)
    vim.pack.del({ src = opts.args })
  end, { nargs = 1, desc = "Uninstall package" }
)

----------------------------------------------------------------------
--- Window navigation
----------------------------------------------------------------------
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to lower split" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to upper split" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center the cursor" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center the cursor" })

----------------------------------------------------------------------
--- LSP
----------------------------------------------------------------------
keymap("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
keymap("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap("n", "<leader>gr", vim.lsp.buf.implementation, { desc = "Show refrences" })
keymap("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
keymap("n", "<leader>K", vim.lsp.buf.hover, { desc = "Hover documentation" })
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

----------------------------------------------------------------------
--- Telescope
----------------------------------------------------------------------
keymap("n", "<leader>ff", function()
  require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
    winblend = 0,
    previewer = false,
  }))
end, { desc = "Find files in project" })
keymap("n", "<leader>fg", function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    sorting_strategy = "ascending",
    previewer = false,
  }))
end, { desc = "Fuzzy search in current file" })
keymap("n", "<leader>fs", function()
  require("telescope.builtin").live_grep(require("telescope.themes").get_dropdown({
    winblend = 0,
    previewer = false,
  }))
end, { desc = "Find text in project" })
keymap("n", "<leader>fp", function()
  require("telescope.builtin").commands(require("telescope.themes").get_dropdown({
    winblend = 0,
    previewer = false,
  }))
end, { desc = "Command palette" })

----------------------------------------------------------------------
--- Conform
----------------------------------------------------------------------
keymap("n", "<Tab>", function()
  require("conform").format({
    lsp_fallback = true,
    timeout_ms = 2000,
  })
end, { desc = "Format buffer" })


----------------------------------------------------------------------
--- Conform
----------------------------------------------------------------------
vim.keymap.set("n", "<C-/>", function()
  require("Comment.api").toggle.linewise.current()
end, opts, { desc = "Comment line" })
vim.keymap.set("v", "<C-/>", function()
  local api = require("Comment.api")
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  api.toggle.linewise(vim.fn.visualmode())
end, opts, { desc = "Comment lines" })

----------------------------------------------------------------------
--- Nvim-tree
----------------------------------------------------------------------
keymap({ "n", "x" }, "<C-b>", "<cmd>:NvimTreeToggle<CR>", opts, { desc = "Toggle neotree" })


----------------------------------------------------------------------
--- Clipboard
----------------------------------------------------------------------
keymap({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy text into system clipboard" })
keymap({ "n", "x" }, "<leader>p", '"+p', { desc = "Pase text from system clipboard" })

----------------------------------------------------------------------
--- Terminal
----------------------------------------------------------------------
keymap("t", "<Esc>", "<C-\\><C-N>", { desc = "Exit terminal mode" })
keymap("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Toggle terminal" }, opts)

----------------------------------------------------------------------
--- Search
----------------------------------------------------------------------
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
keymap("n", "n", "nzzzv", { desc = "Jumps to next appearence of selected word and centers the screen" })
keymap("n", "N", "Nzzzv", { desc = "Jumps to previous appearence of selected word and centers the screen" })

----------------------------------------------------------------------
--- Discipline
----------------------------------------------------------------------
keymap({ "n", "x" }, "<left>", '<cmd>echo "Use h to move"<CR>', { desc = "Disables left arrow key" })
keymap({ "n", "x" }, "<up>", '<cmd>echo "Use j to move"<CR>', { desc = "Disables up arrow key" })
keymap({ "n", "x" }, "<down>", '<cmd>echo "Use k to move"<CR>', { desc = "Disables down arrow key" })
keymap({ "n", "x" }, "<right>", '<cmd>echo "Use l to move"<CR>', { desc = "Disables right arrow key" })
keymap({ "n", "x", "v", "i" }, "<C-c>", "<Nop>", { desc = "Disable Ctrl+C" })
keymap({ "n", "x", "v", "i" }, "<C-v>", "<Nop>", { desc = "Disable Ctrl+V" })

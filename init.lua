require("core.packages")
require("core.keymaps")

local opt = vim.opt
local o = vim.o

opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.cursorline = false -- Highlights current line
opt.wrap = true -- Enable line wrapping
opt.linebreak = true -- Wrap lines at word boundaries
opt.breakindent = true -- Preserve indentation
opt.showbreak = "↪ " -- Prefix wrapped lines with this symbol
opt.scrolloff = 10 -- Keep 10 lines above/below cursor

opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2 -- Number of spaces for a tab
opt.softtabstop = 2 -- Number of spaces for a tab when editing
opt.shiftwidth = 2 -- Number of spaces for auto-indent
opt.smartindent = true -- Smart auto-indent
opt.autoindent = true -- Copy indent from current line

opt.ignorecase = true -- Case sensitive search
opt.smartcase = true -- Case sensitive if in string
opt.hlsearch = true -- highlight search matches
opt.incsearch = true -- Show matches as you type

opt.undofile = true -- Enable undo persistance
opt.signcolumn = "yes" -- Always show a sign column
opt.showmatch = true -- Highlight matching brackets
opt.termguicolors = true -- Enable true colors
opt.mouse = "a" -- Enable mouse support
opt.spell = true -- Enables spell checking
-- opt.clipboard:append("unnamedplus") -- Use system clipboard
opt.autoread = true -- Auto reload changes if outside of neovim
opt.autowrite = false -- Disables auto save

o.confirm = true -- Enables confirmation
o.cmdheight = 0 -- Hides cmd line

vim.cmd("colorscheme carbonfox")

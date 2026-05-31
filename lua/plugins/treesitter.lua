local treesitter = require("nvim-treesitter")

treesitter.setup({
  ensure_installed = {
    "lua",
    "javascript",
    "typescript",
    "python",
    "c",
    "cpp",
    "arduino",
    "objc"
  },
  highlight = { enable = true }
})

return treesitter

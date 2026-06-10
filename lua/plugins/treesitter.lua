local treesitter = require("nvim-treesitter")

treesitter.install({
    "lua",
    "javascript",
    "typescript",
    "python",
    "c",
    "cpp",
    "arduino",
    "objc"
})

return treesitter

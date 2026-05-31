local tree = require("nvim-tree")

tree.setup({
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
  git = {
    ignore = false,
  }
})

return tree

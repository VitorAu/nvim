local neotree = require("neo-tree")

neotree.setup({
  window = {
    position = "left",
    width = 40,
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_ignored = false,

      hide_by_name = {
        ".DS_Store",
      }
    },
  }
})

return neotree

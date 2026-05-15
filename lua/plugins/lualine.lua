local lualine = require("lualine")

lualine.setup({
  options = {
    component_separators = "",
    section_separators = "",

    theme = "codedark",
    sections = {
      lualine_a = { "branch" },
      lualine_b = { "filename" },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { "encoding", "filetype" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = { "location" },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
  }
})

return lualine

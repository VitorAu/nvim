local inline = require("tiny-inline-diagnostic")

inline.setup({
  preset = "classic",
  multilines = { enabled = true },
  show_source = { enabled = true },
  add_messages = { display_count = true },
})

return inline

local blink = require("blink.cmp")

blink.setup({
  keymap = { preset = "super-tab" },
  completion = { documentation = { auto_show = true } },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  fuzzy = { implementation = "lua" }
})

return blink

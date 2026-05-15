local conform = require("conform")

conform.setup({
  c = { "clang_format" },
  cpp = { "clang_format" },
  lua = { "stylua" },
  python = { "black" },
  javascript = { "prettier" },
  typescript = { "prettier" },
  json = { "prettier" },
  html = { "prettier" },
  css = { "prettier" },
})

return conform

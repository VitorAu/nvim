local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

mason.setup({})
mason_lsp.setup({
  ensure_installed = {
    "lua_ls",
    "vtsls",
    "eslint",
    "tailwindcss",
    "clangd",
    "pyright",
    "yamlls",
    "dockerls",
    "arduino_language_server",
  },
  automatic_installation = true,
})

-----------------------------------------------------------------------
-- C / C++
-----------------------------------------------------------------------
vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
})

vim.lsp.enable("clangd")

-----------------------------------------------------------------------
-- PYTHON
-----------------------------------------------------------------------
vim.lsp.config("pyright", {
  settings = {
    python = {
      venvPath = ".",
      venv = ".venv",
    },
  },
})

vim.lsp.enable("pyright")

-----------------------------------------------------------------------
-- LUA
-----------------------------------------------------------------------
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
        disable = { "different-requires" },
      },
    },
  },
})

vim.lsp.enable("lua_ls")

-----------------------------------------------------------------------
-- TypeScript / JavaScript
-----------------------------------------------------------------------
vim.lsp.config("vtsls", {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
})

vim.lsp.enable("vtsls")

-----------------------------------------------------------------------
-- ESLint
-----------------------------------------------------------------------
vim.lsp.config("eslint", {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
})

vim.lsp.enable("eslint")

-----------------------------------------------------------------------
-- ARDUINO
-----------------------------------------------------------------------
vim.lsp.config("arduino_language_server", {
  cmd = {
    "arduino-language-server",
    "-cli",
    "arduino-cli",
    "-cli-config",
    vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
    "-clangd",
    "clangd",
    "-fqbn",
    "arduino:avr:uno",
  },
  filetypes = { "arduino" },
  root_dir = vim.fs.root(0, { "*.ino", ".git" }),
})

vim.lsp.enable("arduino_language_server")

-----------------------------------------------------------------------
-- DIAGNOSTICS
-----------------------------------------------------------------------
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  underline = true,
  severity_sort = true,
  float = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

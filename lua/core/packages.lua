----------------------------------------------------------------------
--- Dependencies
----------------------------------------------------------------------
vim.pack.add({
  { src = "https://github.com/MunifTanjim/nui.nvim.git" },                   -- enabled
  { src = "https://github.com/nvim-lua/plenary.nvim.git" },                  -- enabled
  { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },    -- enabled
  { src = "https://github.com/nvim-telescope/telescope-file-browser.nvim" }, -- enabled
  { src = "https://github.com/neovim/nvim-lspconfig" },                      -- enabled
  { src = "https://github.com/saghen/blink.lib.git" }                        -- enabled
})

----------------------------------------------------------------------
--- Plugins
----------------------------------------------------------------------
vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter.git",
    branch = "main",
    build = ":TSUpdate"
  },                                                                         -- enabled
  { src = "https://github.com/EdenEast/nightfox.nvim.git" },                 -- enabled
  { src = "https://github.com/nvim-tree/nvim-web-devicons.git" },            -- enabled
  { src = "https://github.com/nvim-lualine/lualine.nvim" },                  -- enabled
  { src = "https://github.com/mason-org/mason.nvim.git" },                   -- enabled
  -- { src = "https://github.com/nvim-neo-tree/neo-tree.nvim.git" },            -- disabled
  { src = "https://github.com/nvim-telescope/telescope.nvim.git" },          -- enabled
  { src = "https://github.com/mason-org/mason-lspconfig.nvim.git" },         -- enabled
  { src = "https://github.com/stevearc/conform.nvim.git" },                  -- enabled
  { src = "https://github.com/saghen/blink.cmp.git" },                       -- enabled
  { src = "https://github.com/numToStr/Comment.nvim.git" },                  -- enabled
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim.git" }, -- enabled
  { src = "https://github.com/akinsho/toggleterm.nvim.git" },                -- enabled
  { src = "https://github.com/nvim-tree/nvim-tree.lua.git" },                -- enabled
})

require("plugins.nightfox")
-- require("plugins.neotree")
require("plugins.devicons")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.lsp")
require("plugins.conform")
require("plugins.treesitter")
require("plugins.blink")
require("plugins.comment")
require("plugins.inline")
require("plugins.toggleterm")
require("plugins.tree")

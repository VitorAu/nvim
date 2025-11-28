return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    lsp = {
      progress = { enabled = true },
      hover = { enabled = true },
      signature = { enabled = true },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
        opts = { skip = true },
      },
    },
    views = {
      cmdline_popup = {
        position = { row = "50%", col = "50%" },
        size = { width = 60, height = "auto" },
        border = { style = "rounded" },
      },
      popupmenu = {
        relative = "editor",
        position = { row = 10, col = "50%" },
        size = { width = 60, height = 10 },
        border = { style = "rounded" },
      },
    },
  },
  config = function(_, opts)
    local noice = require("noice")
    noice.setup(opts)
    vim.notify = noice.notify
  end,
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false, -- load at startup
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "OilActionsPost",
      callback = function(event)
        if event.data.actions.type == "move" then
          require("snacks.rename").on_rename_file(
            event.data.actions.src_url,
            event.data.actions.dest_url
          )
        end
      end,
    })
  end,
  keys = {
    { "<leader>bd", function() require("snacks").bufdelete() end,       desc = "Buffer delete",       mode = "n" },
    { "<leader>ba", function() require("snacks").bufdelete.all() end,   desc = "Buffer delete all",   mode = "n" },
    { "<leader>bo", function() require("snacks").bufdelete.other() end, desc = "Buffer delete other", mode = "n" },
    { "<leader>bz", function() require("snacks").zen() end,             desc = "Toggle Zen Mode",     mode = "n" },
  },
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      preset = {
        pick = nil,
        keys = {
          { icon = " ", key = "p", desc = "Search Project", action = ":lua require('telescope').extensions.file_browser.file_browser({ path = vim.loop.cwd() })" },
          { icon = " ", key = "f", desc = "Find File", action = ":lua require('snacks.dashboard').pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "c", desc = "Config", action = ":lua require('snacks.dashboard').pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
                                 
  ████ ██████           █████      ██                     
 ███████████             █████                             
 █████████ ███████████████████ ███   ███████████   
█████████  ███    █████████████ █████ ██████████████   
█████████ ██████████ █████████ █████ █████ ████ █████   
███████████ ███    ███ █████████ █████ █████ ████ █████  
██████  █████████████████████ ████ █████ █████ ████ ██████ 
        ]],
      },
      sections = {
        { section = 'header' },
        { section = "keys", indent = 1, padding = 1 },
        { section = 'recent_files', icon = ' ', title = 'Recent Files', indent = 3, padding = 2 },
        { section = "startup" },
      },
    },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = false },
    picker = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    rename = { enabled = true },
    zen = {
      enabled = true,
      toggles = {
        ufo             = true,
        dim             = true,
        git_signs       = false,
        diagnostics     = false,
        line_number     = false,
        relative_number = false,
        signcolumn      = "no",
        indent          = false,
      },
    },
  },
  config = function(_, opts)
    local Snacks = require("snacks")
    Snacks.setup(opts)

    Snacks.toggle.new({
      id = "ufo",
      name = "Enable/Disable ufo",
      get = function()
        return require("ufo").inspect()
      end,
      set = function(state)
        if state == nil then
          require("noice").enable()
          require("ufo").enable()
          vim.o.foldenable = true
          vim.o.foldcolumn = "1"
        else
          require("noice").disable()
          require("ufo").disable()
          vim.o.foldenable = false
          vim.o.foldcolumn = "0"
        end
      end,
    })
  end
}

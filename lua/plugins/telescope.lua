local telescope = require("telescope")

telescope.setup()

telescope.load_extension("ui-select")
telescope.load_extension("file_browser")

return telescope

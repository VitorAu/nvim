return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", function()
				telescope.find_files()
			end, {
				desc = "Find files in project",
			})
			vim.keymap.set("n", "<C-f>", function()
				telescope.live_grep()
			end, {
				desc = "Find text in project",
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown({}) },
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

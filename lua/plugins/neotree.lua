return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				follow_current_file = true,
				use_libuv_file_watcher = true,
			},
		})
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				vim.cmd("Neotree reveal left")
			end,
		})
		vim.keymap.set("n", "<C-b>", ":Neotree toggle left show <CR>", {
      desc = "Toggle file explorer",
    })
	end,
	lazy = false,
}

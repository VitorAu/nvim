return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			shade_terminals = true,
			direction = "float",
			float_opts = {
				border = "curved",
			},
			start_in_insert = false,
		})

		function _G.toggle_term(id)
			local Terminal = require("toggleterm.terminal").Terminal
			local term = Terminal:new({
				id = id,
			})
			term:toggle()
		end

		vim.keymap.set("n", "th", function()
			toggle_term(1)
		end, { desc = "Toggle terminal 1", noremap = true, silent = true })
		vim.keymap.set("n", "tj", function()
			toggle_term(2)
		end, { desc = "Toggle terminal 2", noremap = true, silent = true })
		vim.keymap.set("n", "tk", function()
			toggle_term(3)
		end, { desc = "Toggle terminal 3", noremap = true, silent = true })
		vim.keymap.set("n", "tl", function()
			toggle_term(4)
		end, { desc = "Toggle terminal 4", noremap = true, silent = true })
		vim.keymap.set("n", "tt", ":ToggleTerm<CR>", { desc = "Hide terminal and exit to normal mode" })
		vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
	end,
}

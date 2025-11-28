return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			shade_terminals = true,
			direction = "float",
			float_opts = { border = "curved" },
			start_in_insert = false,
		})

		function _G.toggle_term(id)
			local Terminal = require("toggleterm.terminal").Terminal
			local term = Terminal:new({ id = id })
			term:toggle()
		end
	end,
}

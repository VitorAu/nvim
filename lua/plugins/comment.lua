return {
	"numToStr/Comment.nvim",
	config = function()
		local comment = require("Comment")
		comment.setup()
		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "c", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
		vim.api.nvim_set_keymap(
			"v",
			"c",
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			opts
		)
	end,
}

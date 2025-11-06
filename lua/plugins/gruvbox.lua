return {
	"morhetz/gruvbox",
	priority = 1000,
	config = function()
		vim.opt.termguicolors = false
		vim.o.background = "dark"
		vim.g.gruvbox_contrast_dark = "soft"
		vim.cmd.colorscheme("gruvbox")
	end,
}

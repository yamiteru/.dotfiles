vim.g.catppuccin_flavour = "macchiato"

require("catppuccin").setup({
	flavout = "macchiato",
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
	}
})

vim.cmd [[colorscheme catppuccin]]

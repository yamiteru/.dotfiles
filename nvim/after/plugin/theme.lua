vim.g.catppuccin_flavour = "macchiato"

require("catppuccin").setup({
	flavout = "macchiato",
	integrations = {
		coc_nvim = true,
		treesitter = true,
		dap = {
			enabled = true,
    },
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		}
	},
})

vim.cmd [[colorscheme catppuccin]]

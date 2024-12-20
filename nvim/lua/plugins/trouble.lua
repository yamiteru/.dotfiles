return {
	"folke/trouble.nvim",
	opts = {
		position = "bottom",
		mode = "document_diagnostics",
		severity = vim.diagnostic.severity.ERROR,
		padding = false,
		multiline = false
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
	},
}
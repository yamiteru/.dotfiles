return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "<leader>ft", ":Neotree toggle<CR>", desc = "Toggle neotree" }
	},
	opts = {
		close_if_last_window = true,
		enable_git_status = false,
		enable_diagnostics = true,
		window = {
			position = "right",
			width = 30,
		}
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	}
}

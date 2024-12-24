return {
	"cbochs/grapple.nvim",
	opts = {
		scope = "git_branch",
		icons = false,
		status = false,
		win_opts = {
			width = 0.5
		}
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{ "<leader>t", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
		{ "<leader>ft", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
		{ "<c-h>", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
		{ "<c-j>", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
		{ "<c-k>", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
		{ "<c-l>", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
		{ "<c-}>", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
		{ "<c-{>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
	},
}

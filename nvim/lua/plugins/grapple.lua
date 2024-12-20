return {
	"cbochs/grapple.nvim",
	opts = {
		scope = "git_branch",
		icons = false,
		status = false,
		win_opts = {
			width = 0.75
		}
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{ "<leader>m", "<cmd>Grapple toggle<cr>",          desc = "Grapple toggle tag" },
		{ "<leader>M", "<cmd>Grapple toggle_tags<cr>",     desc = "Grapple open tags window" },
		-- TODO: change to [ and ]
		{ "<leader>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
		{ "<leader>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
		{ "<c-h>",     "<cmd>Grapple select index=1<cr>",  desc = "Select first tag" },
		{ "<c-j>",     "<cmd>Grapple select index=2<cr>",  desc = "Select second tag" },
		{ "<c-k>",     "<cmd>Grapple select index=3<cr>",  desc = "Select third tag" },
		{ "<c-l>",     "<cmd>Grapple select index=4<cr>",  desc = "Select fourth tag" },
	},
}

return {
  "ibhagwan/fzf-lua",
	event = "BufReadPre",
	opts = {
		"borderless",
		fzf_colors = true,
		winopts = {
			backdrop = 80,
			preview = {
				border = "noborder",
				title = false,
				scrollbar = false,
				delay = 0
			}
		},
	},
	keys = {
		{ "<leader>ff", "<cmd>lua require('fzf-lua').files({ resume = false })<CR>" },
		{ "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<CR>" },
	}
}

return {
  "ibhagwan/fzf-lua",
	event = "BufReadPre",
	opts = {},
	keys = {
		{ "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>" },
		{ "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<CR>" },
	}
}

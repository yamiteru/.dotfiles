return {
  "gbprod/yanky.nvim",
  opts = {},
	keys = {
		{"p", "<Plug>(YankyPutAfter)"},
		{"P", "<Plug>(YankyPutBefore)"},
		{"gp", "<Plug>(YankyGPutAfter)"},
		{"gP", "<Plug>(YankyGPutBefore)"},
		{"<c-p>", "<Plug>(YankyPreviousEntry)"},
		{"<c-n>", "<Plug>(YankyNextEntry)"},
		{"<leader>fy", "<CMD>YankyRingHistory<CR>"},
	},
	event = {
		"BufReadPost",
		"BufNewFile"
	},
}

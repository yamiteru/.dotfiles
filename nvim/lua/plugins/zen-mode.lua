return {
  "folke/zen-mode.nvim",
  opts = {
		window = {
			width = 60,
		}
  },
	event = {
		"BufReadPost",
		"BufNewFile"
	},
	keys = {
		{ "<leader>z", "<CMD>ZenMode<CR>" }
	}
}

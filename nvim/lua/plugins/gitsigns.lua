return {
  "lewis6991/gitsigns.nvim",
  opts = {
		attach_to_untracked = true,
		current_line_blame_opts = {
			virt_text_pos = "right_align",
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		sign_priority = 1,
	},
  event = "BufReadPre",
  keys = {
		{ 
			"<leader>gb", "<CMD>Gitsigns toggle_current_line_blame<CR>",
			desc = "Toggle git blame" 
		},
  },
}

return {
  {
    "stevearc/oil.nvim",
		event = "VimEnter",
		opts = {
			default_file_explorer = true,
			columns = {},
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			watch_for_changes = true,
			lsp_file_methods = {
				enabled = true,
				timeout_ms = 5000,
				autosave_changes = true,
			},
			keymaps = {
				["<M-h>"] = "actions.select_split",
			},
			view_options = {
				show_hidden = true,
				natural_order = true,
			}
		},
		init = function()
			if vim.fn.argc() == 0 then
				require("oil").open()
			end
		end,
		keys = {
			{ "-", "<CMD>Oil<CR>" },
		}
  },
}

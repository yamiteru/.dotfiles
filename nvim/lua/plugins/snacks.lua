return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = {
			notify = false,
		},
		bufdelete = {},
		git = {},
		image = {},
		input = {},
		indent = {
			only_scope = true,
			only_current = true,
			animate = {
				enabled = false
			},
		},
		picker = {},
		explorer = {},
		quickfile = {},
		words = {},
		zen = {
			zoom = {
				win = {
					width = 60,
				},
			},
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
		  pattern = "OilActionsPost",
		  callback = function(event)
			  if event.data.actions.type == "move" then
				  Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
			  end
		  end,
		})
	end,
	keys = {
		{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>fe", function() Snacks.explorer() end, desc = "Explorer" },
		{ "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git blame" },
		{ "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
	},
}

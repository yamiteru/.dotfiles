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
		indent = {
			only_scope = true,
			only_current = true,
			animate = {
				enabled = false
			},
		},
		picker = {},
		quickfile = {},
		zen = {
			zoom = {
				win = {
					width = 60,
				},
			},
		},
	},
	keys = {
		{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
	},
}

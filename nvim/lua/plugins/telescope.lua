function config()
	local telescope = require("telescope")

	telescope.setup({
		-- TODO: use more minimalist layout
		defaults = {
			file_ignore_patterns = { 
				"^.git/", 
				"^.cache/",
				"^.node_modules/",
			},
      path_display = { "smart" },
      sorting_strategy = "descending",
		},
		extensions = {
			fzy_native = { 
				override_generic_sorter = false, 
				override_file_sorter = true 
			},
		}
	})

  telescope.load_extension("fzy_native")
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-fzy-native.nvim" },
	},
	cmd = "Telescope",
	keys = {
		{ 
			"<leader>ff", 
			function() 
				require("telescope.builtin").find_files()
			end, 
			desc = "Find files" 
		},
		{
			"<Leader>fg",
			function()
					require("telescope.builtin").live_grep()
			end,
			desc = "File grep",
		},
	},
	config = config
}

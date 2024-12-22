return {
	"echasnovski/mini.surround",
	event = {
		"BufReadPost",
		"BufNewFile"
	},
	opts = {
		highlight_duration = 250,
		respect_selection_type = true,
		silent = true,
		search_method = 'cover',
		n_lines = 100
	}
}

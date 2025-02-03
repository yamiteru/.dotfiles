return {
	"Pocco81/auto-save.nvim",
	opts = {
		debounce_delay = 10000
	},
	event = {
		"BufReadPost",
		"BufNewFile"
	},
}

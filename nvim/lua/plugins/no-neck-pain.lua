return {
	"shortcuts/no-neck-pain.nvim",
	lazy = false,
	opts = {
		width = 70,
		minSideBufferWidth = 4,
		killAllBuffersOnDisable = true,
		autocmds = {
			enableOnVimEnter = true,
			enableOnTabEnter = true,
			reloadOnColorSchemeChange = true,
			skipEnteringNoNeckPainBuffer = true
		},
		mappings = {
			enabled = true
		}
	}
}

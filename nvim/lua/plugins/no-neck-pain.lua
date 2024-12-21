return {
	"shortcuts/no-neck-pain.nvim",
	event = "VeryLazy",
	opts = {
		width = 80,
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
		},
		integrations = {
			NeoTree = {
				position = "right",
				reopen = true,
			},
		}
	}
}

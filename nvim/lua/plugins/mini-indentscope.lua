return {
	"echasnovski/mini.indentscope",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		draw = {
			delay = 0,
			animation = function()
				return 0
			end
		},
		options = {
			try_as_border = true,
		},
	}
}

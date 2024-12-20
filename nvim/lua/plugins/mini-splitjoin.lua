return {
	"echasnovski/mini.splitjoin",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		detect = {
			brackets = { '%b()', '%b[]', '%b{}' },
			separator = ','
		}
	}
}

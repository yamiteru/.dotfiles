return {
	"ms-jpq/coq_nvim",
	branch = "coq",
	event = "InsertEnter",
	build = ":COQdeps",
	dependencies = {
		{ "ms-jpq/coq.artifacts",  branch = "artifacts" },
		{ "ms-jpq/coq.thirdparty", branch = "3p" },
	},
	init = function()
		vim.g.coq_settings = {
			auto_start = "shut-up",
		}
	end,
	config = function()
		require('render-markdown.integ.coq').setup()
	end
}

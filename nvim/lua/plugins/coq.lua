return {
	"ms-jpq/coq_nvim",
	branch = "coq",
	event = "InsertEnter",
	build = ":COQdeps",
	dependencies = {
		{ "ms-jpq/coq.artifacts", branch = "artifacts" },
		{ "ms-jpq/coq.thirdparty", branch = "3p" },
	},
	init = function()
		vim.g.coq_settings = {
			auto_start = "shut-up",
			completion = {
				always = false
			},
			display = {
				ghost_text = {
					enabled = false
				}
			},
			keymap = {
				manual_complete = "<c-e>",
				manual_complete_insertion_only = true
			}
		}
	end
}

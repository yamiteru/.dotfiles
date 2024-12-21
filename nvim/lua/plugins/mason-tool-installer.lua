return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
		auto_update = true,
		run_on_start = true,
		ensure_installed = {
			"js-debug-adapter",
			"codespell",
			"lua-language-server",
			"stylua",
		},
	},
  cmd = "MasonToolsUpdate",
  event = "BufReadPre",
  dependencies = {
		"williamboman/mason.nvim"
	},
}

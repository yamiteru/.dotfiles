return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
		ensure_installed = {
			"lua_ls",
			"cssls",
			"denols",
			"html",
			"jsonls",
			"stylelint_lsp",
			"svelte",
			"tailwindcss",
			"ts_ls",
			"biome",
			"eslint",
			"zls",
			"yamlls",
			"taplo",
		},
		automatic_installation = true,
	},
  event = "BufReadPre",
  dependencies = "williamboman/mason.nvim",
}

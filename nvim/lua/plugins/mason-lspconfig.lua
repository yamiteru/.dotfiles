return {
  "williamboman/mason-lspconfig.nvim",
  event = "BufReadPre",
  dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig"
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
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
		})

    require("mason-lspconfig").setup_handlers {
			function (server_name)
				require("lspconfig")[server_name].setup({})
			end,
    }

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local opts = { buffer = ev.buf }

				vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, opts)
				vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
				vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
			end,
		})
	end
}

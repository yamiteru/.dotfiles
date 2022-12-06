local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
	'svelte',
	'tailwindcss',
	'jsonls',
	'html',
	'golangci_lint_ls',
	'cssls',
	'cssmodules_ls',
  'eslint',
  'sumneko_lua',
})

lsp.nvim_workspace()

lsp.setup()

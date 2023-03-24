require('nvim-treesitter.configs').setup {
  ensure_installed = {
		'lua',
		'css',
		'dockerfile',
		'gitignore',
		'html',
		'javascript',
		'typescript',
		'markdown',
		'prisma',
		'regex',
		'svelte',
		'tsx'
	},

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
  },
}

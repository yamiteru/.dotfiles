require('nvim-treesitter.configs').setup {
  ensure_installed = {
		'lua',
		'rust',
		'css',
		'dockerfile',
		'gitignore',
		'go',
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

	incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  highlight = {
    enable = true,
    disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
  },
}

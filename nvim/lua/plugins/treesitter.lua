function config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"css",
			"csv",
			"html",
			"javascript",
			"json",
			"markdown_inline",
			"python",
			"svelte",
			"toml",
			"tsx",
			"typescript",
			"yaml",
			"zig",
		},
		auto_install = true,
		indent = { enable = true },
		highlight = {
			enable = true,
			disable = function(_, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 5000
      end,
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
        init_selection = 'gnn',
        node_incremental = '.',
        scope_incremental = 'grc',
        node_decremental = ',',
      }
		}
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	config = config
}

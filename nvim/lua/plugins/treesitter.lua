function config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
		},
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
		highlight = {
			enable = true,
			disable = function(lang, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 5000
      end,
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true,
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

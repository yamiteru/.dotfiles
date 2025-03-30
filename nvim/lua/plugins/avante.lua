return {
  "yetone/avante.nvim",
	-- event = { "BufReadPost", "BufNewFile" },
  version = false,
  opts = {},
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
}

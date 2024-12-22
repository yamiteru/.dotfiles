return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  opts = {
		claude = {
			model = "claude-3-5-sonnet-20241022",
			temperature = 0,
			max_tokens = 8192,
		},
		hints = {
			enabled = false
		},
		behaviour = {
			auto_focus_sidebar = false,
		},
		windows = {
			position = "right",
			sidebar_header = {
				enabled = false
			},
		}
  },
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}

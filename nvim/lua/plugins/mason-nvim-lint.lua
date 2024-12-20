return {
  "rshkarin/mason-nvim-lint",
  opts = {
		quiet_mode = true,
	},
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-lint",
  },
  enabled = true,
}

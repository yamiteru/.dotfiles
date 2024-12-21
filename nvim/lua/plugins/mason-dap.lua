return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
		ensure_installed = {
			"js",
			"node2",
			"chrome"
		},
		automatic_installation = true,
		automatic_setup = true,
	},
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {
				enabled = true,
				enabled_commands = true,
				highlight_changed_variables = true,
				highlight_new_as_changed = true,
				show_stop_reason = true,
				only_first_definition = true,
				all_references = true
			}
		}
  },
}

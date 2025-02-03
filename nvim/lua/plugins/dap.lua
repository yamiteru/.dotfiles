-- In your lazy plugins configuration file (e.g., lua/plugins/debug.lua)
return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio"
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Configure Zig adapter
		dap.adapters.codelldb = {
			type = 'server',
			port = "${port}",
			executable = {
				command = 'codelldb',
				args = {"--port", "${port}"},
			}
		}

		-- Configure Zig configuration
		dap.configurations.zig = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = '${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}',
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
				args = {},
				runInTerminal = false,
			}
		}

		-- Configure DAP UI
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸" },
			mappings = {
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.25 },
						"breakpoints",
						"stacks",
						"watches",
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						"repl",
						"console",
					},
					size = 0.25,
					position = "bottom",
				},
			},
			floating = {
				max_height = nil,
				max_width = nil,
				border = "single",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
		})

		-- Automatically open/close dapui when debugging starts/ends
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- Add virtual text support
		require("nvim-dap-virtual-text").setup()

		-- Key mappings
		vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
		vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step Over' })
		vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
		vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug: Step Out' })
		vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
		vim.keymap.set('n', '<leader>B', function()
			dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
		end, { desc = 'Debug: Set Conditional Breakpoint' })
		vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'Debug: Open REPL' })
		vim.keymap.set('n', '<leader>dl', dap.run_last, { desc = 'Debug: Run Last' })
	end,
	event = {
		"BufReadPost",
		"BufNewFile"
	},
}

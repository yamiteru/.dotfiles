---------------------------------------------------------
-- Globals
---------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.laststatus = 3
vim.o.winbar = "%f %m"

vim.o.cmdheight = 0

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.clipboard = "unnamedplus"

vim.o.swapfile = false

vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

vim.o.signcolumn = "yes:1"

vim.o.number = false
vim.o.relativenumber = false

vim.o.mouse = ""

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.background = "light"
vim.o.termguicolors = true

vim.o.breakindent = true

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.splitkeep = "screen"

vim.o.scrolloff = 10

vim.o.hlsearch = true

vim.o.fillchars = "eob: ,horiz: ,horizup: ,horizdown: ,vert: ,vertleft: ,vertright: ,verthoriz: ,fold: ,foldopen: ,foldclose: ,diff: ,lastline: "

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = false,
})

vim.g.lspTimeoutConfig = {
    stopTimeout  = 1000 * 60 * 5,
    startTimeout = 0,
    silent       = true
}

---------------------------------------------------------
-- Load lazy
---------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

---------------------------------------------------------
-- Dependencies
---------------------------------------------------------

require("lazy").setup({
	spec = {
		-- Shared Lua utils
		"nvim-lua/plenary.nvim",

		-- Promise & Async in Lua
		"kevinhwang91/promise-async",
		"nvim-neotest/nvim-nio",

		-- SQLite LuaJIT binding with a very simple api
		"kkharji/sqlite.lua",

		-- Provides SchemaStore catalog for jsonls/yamlls
		"b0o/SchemaStore.nvim",

		-- Creates missing folders on save
		"jghauser/mkdir.nvim",

		-- Better highlighting
		{
			"nvim-treesitter/nvim-treesitter",
			branch = 'master',
			lazy = false,
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					indent = {
						enable = true
					},
					highlight = {
						enable = true,
						additional_vim_regex_highlighting = false
					},
					incremental_selection = {
						enable = true
					}
				})
			end
		},

		-- Move line/selection in any direction
		{
			"echasnovski/mini.move",
			opts = {}
		},

		-- Highlight patterns in text
		{
			"echasnovski/mini.hipatterns",
			opts = {}
		},

		-- Highlight word under cursor
		{
			"echasnovski/mini.cursorword",
			opts = {}
		},

		-- Go forward/backward with square brackets
		{
			"echasnovski/mini.bracketed",
			opts = {}
		},

		-- Minimal and fast autopairs
		{
			"echasnovski/mini.pairs",
			opts = {}
		},

		-- Split and join arguments
		{
			"echasnovski/mini.splitjoin",
			opts = {}
		},

		-- Fast and feature-rich surround actions
		{
			"echasnovski/mini.surround",
			opts = {}
		},

		-- Work with trailing whitespace
		{
			"echasnovski/mini.trailspace",
			opts = {}
		},

		-- Configurable auto-formatting
		{
			"stevearc/conform.nvim",
			opts = {
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					json = { "prettierd", "prettier", stop_after_first = true },
					zig = { "zigfmt" },
				},
			},
		},

		-- Visualize scope with vertical line
		{
			"nvim-mini/mini.indentscope",
			config = function()
				require("mini.indentscope").setup({
					draw = {
						delay = 0,
						animation = require('mini.indentscope').gen_animation.none()
					},
					options = {
						try_as_border = true
					},
					symbol = "|"
				})
			end
		},

		-- File explorer that works like a buffer
		{
			"stevearc/oil.nvim",
			keys = {
				{ "-", "<CMD>Oil<CR>", desc = "Open file explorer" },
			},
			opts = {
				default_file_explorer = true,
				columns = {},
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				watch_for_changes = true,
				lsp_file_methods = {
					enabled = true,
					timeout_ms = 5000,
					autosave_changes = true,
				},
				view_options = {
					show_hidden = true,
					natural_order = true,
				}
			}
		},

		-- Dim unfocused buffers to be less distracting
		{
			"miversen33/sunglasses.nvim",
			opts = {
				filter_type = "SHADE",
				filter_percent = 0.35,
			},
		},

		-- Git signs in the sign column
		{
			"lewis6991/gitsigns.nvim",
			opts = {
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "-" },
					changedelete = { text = "~" },
				},
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns
					local opts = function(desc) return { buffer = bufnr, desc = desc } end
					vim.keymap.set("n", "]c", gs.next_hunk, opts("Next hunk"))
					vim.keymap.set("n", "[c", gs.prev_hunk, opts("Previous hunk"))
					vim.keymap.set("n", "<leader>hs", gs.stage_hunk, opts("Stage hunk"))
					vim.keymap.set("n", "<leader>hr", gs.reset_hunk, opts("Reset hunk"))
					vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts("Preview hunk"))
					vim.keymap.set("n", "<leader>hb", gs.blame_line, opts("Blame line"))
				end,
			},
		},

		-- Light theme
		{
			"folke/tokyonight.nvim",
			config = function()
				vim.cmd[[colorscheme tokyonight-day]]
			end
		},

		-- Picker based on fzf
		{
			"ibhagwan/fzf-lua",
			keys = {
				{ "<leader>ff", "<CMD>FzfLua frecency cwd_only=true display_score=false<CR>", desc = "Find files" },
				{ "<leader>fb", "<CMD>FzfLua buffers<CR>", desc = "Find buffers" },
				{ "<leader>fg", "<CMD>FzfLua live_grep<CR>", desc = "Live grep" },
			},
			opts = {
				winopts = {
					backdrop = 0,
					border = "none",
					title_flags = false,
					fullscreen = true,
					row = 0,
					col = 0,
					width = 1,
					height = 1,
					preview = {
						border = "none",
						title = false,
						delay = 50,
						winopts = {
							number = false,
							cursorline = false
						}
					}
				}
			},
			dependencies = {
				-- Frecency sorting for fzf-lua
				{
					"elanmed/fzf-lua-frecency.nvim",
					opts = {
						file_icons = false,
						color_icons = false
					}
				}
			}
		},

		-- Performant, batteries-included completion
		{
			"Saghen/blink.cmp",
			opts = {
				keymap = {
					preset = 'default'
				},
				completion = {
					documentation = {
						auto_show = true
					}
				},
				sources = {
				  default = {
					'lsp',
					'path',
					'snippets',
					'buffer'
				  },
				},
				fuzzy = {
					implementation = "prefer_rust",
					prebuilt_binaries = {
						force_version = "1.7.0"
					}
				}

			}
		},


		-- Makes it easier to use lspconfig with mason.nvim
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				automatic_enable = true
			},
			dependencies = {
				-- Install/manage LSP/DAP servers and linters/formatters
				{
					"mason-org/mason.nvim",
					opts = {
						ui = {
							backdrop = 0,
							width = 1,
							height = 1
						}
					}
				},
				-- Collection of LSP server configurations
				"neovim/nvim-lspconfig",
			},
		},

		-- Diagnostics, references, quickfix and location list
		{
			"folke/trouble.nvim",
			keys = {
				{ "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
				{ "<leader>xd", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics" },
				{ "<leader>xs", "<CMD>Trouble symbols toggle<CR>", desc = "Symbols" },
			},
			opts = {
				warn_no_results = false,
				open_no_results = true,
			}
		},

		-- Automatically start/stop LSP servers
		{
			"hinell/lsp-timeout.nvim",
			dependencies={
				"neovim/nvim-lspconfig"
			}
		},

		-- Automatically close inactive buffers
		{
			"chrisgrieser/nvim-early-retirement",
			opts = {
				retirementAgeMins = 5,
				ignoreUnsavedChangesBufs = false,
				ignoreVisibleBufs = true,
				deleteBufferWhenFileDeleted = true
			}
		},

		-- Code folding
		{
			"kevinhwang91/nvim-ufo",
			dependencies = { "kevinhwang91/promise-async" },
			keys = {
				{ "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
				{ "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
				{ "zK", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek fold" },
			},
			config = function()
				require("ufo").setup({
					provider_selector = function()
						return { "treesitter", "indent" }
					end,
					open_fold_hl_timeout = 0,
					close_fold_kinds_for_ft = {
						default = { "imports" },
					},
				})
			end,
		},

		-- Debounced auto-save
		{
			"okuuva/auto-save.nvim",
			cmd = "ASToggle",
			event = {
				"InsertLeave",
				"TextChanged"
			},
			opts = {
				enabled = true,
				debounce_delay = 5000
			},
		},

		-- Centers a window so I don't have to move my head
		{
			"shortcuts/no-neck-pain.nvim",
			keys = {
				{ "<leader>np", "<CMD>NoNeckPain<CR>", desc = "Toggle NoNeckPain" },
			},
			opts = {
				width = 80,
				autocmds = {
					enableOnVimEnter = true,
				},
			},
		},

		-- Tag and quickly open important files
		{
			"cbochs/grapple.nvim",
			keys = {
				{ "<leader>m", "<CMD>Grapple toggle<CR>", desc = "Grapple toggle" },
				{ "<leader>M", "<CMD>Grapple toggle_tags<CR>", desc = "Grapple tags" },
				{ "<leader>1", "<CMD>Grapple select index=1<CR>", desc = "Grapple 1" },
				{ "<leader>2", "<CMD>Grapple select index=2<CR>", desc = "Grapple 2" },
				{ "<leader>3", "<CMD>Grapple select index=3<CR>", desc = "Grapple 3" },
				{ "<leader>4", "<CMD>Grapple select index=4<CR>", desc = "Grapple 4" },
			},
			opts = {
				scope = "git",
				icons = false,
				status = false,
			}
		},

		-- Edit and review GitHub issues and pull requests
		{
			"pwntester/octo.nvim",
			opts = {
				default_merge_method = "rebase",
				picker = "fzf-lua"
			}
		},

		-- Improved UI and workflow for the Neovim quickfix
		{
			"stevearc/quicker.nvim",
			opts = {}
		},

		-- Adds a 'cut' operation separate from 'delete'
		{
			"gbprod/cutlass.nvim",
			opts = {
				cut_key = "x",
				override_del = true
			}
		},

		-- Improved Yank and Put functionalities
		{
			"gbprod/yanky.nvim",
			keys = {
				{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after" },
				{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before" },
				{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "GPut after" },
				{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "GPut before" },
				{ "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Previous yank entry" },
				{ "<c-n>", "<Plug>(YankyNextEntry)", desc = "Next yank entry" },
			},
			opts = {}
		},

		-- Peek lines of the buffer in non-obtrusive way
		{
			"nacro90/numb.nvim",
			opts = {}
		},

		-- Automatically reopen the files and windows you had open
		{
			"rmagatti/auto-session",
			opts = {
				git_use_branch_name = true
			}
		},

		-- Debug Adapter Protocol client implementation
		{
			"mfussenegger/nvim-dap",
			keys = {
				{ "<F5>", function() require("dap").continue() end, desc = "DAP Continue" },
				{ "<F10>", function() require("dap").step_over() end, desc = "DAP Step over" },
				{ "<F11>", function() require("dap").step_into() end, desc = "DAP Step into" },
				{ "<F12>", function() require("dap").step_out() end, desc = "DAP Step out" },
				{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
			},
			config = function()
				local dap = require("dap")

				dap.adapters.codelldb = {
					type = "server",
					port = "${port}",
					executable = {
						command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
						args = { "--port", "${port}" },
					},
				}

				dap.configurations.zig = {
					{
						name = "Launch",
						type = "codelldb",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/zig-out/bin/", "file")
						end,
						cwd = "${workspaceFolder}",
						stopOnEntry = false,
					},
				}
			end,
		},

		-- A UI for nvim-dap with good default config
		{
			"rcarriga/nvim-dap-ui",
			keys = {
				{ "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
			},
			dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
			config = function()
				local dap, dapui = require("dap"), require("dapui")
				dapui.setup()
				dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
				dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
				dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
			end,
		},

		-- Adds virtual text support to nvim-dap
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},
	},
	checker = {
		enabled = true,
		notify = false
	},
	change_detection = {
		notify = false
	},
	ui = {
		size = {
			width = 1,
			height = 1
		},
		backdrop = 0,
	}
})

---------------------------------------------------------
-- Setup
---------------------------------------------------------

-- Trim trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		MiniTrailspace.trim()
	end,
})

require("mason").setup()

local capabilities = require("blink.cmp").get_lsp_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

require("mason-lspconfig").setup({
	ensure_installed = {},
	automatic_installation = true,
	handlers = {
		function(server_name)
			if server_name == "jsonls" then
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					settings = {
						json = {
							schemas = require('schemastore').json.schemas(),
							validate = { enable = true }
						}
					}
				})
			elseif server_name == "lua_ls" then
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" }
							}
						}
					}
				})
			else
				require("lspconfig")[server_name].setup({
					capabilities = capabilities
				})
			end
		end
	}
})

-- LSP keybindings
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = function(desc) return { buffer = args.buf, desc = desc } end
		vim.keymap.set("n", "gd", "<CMD>FzfLua lsp_definitions<CR>", opts("Go to definition"))
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
		vim.keymap.set("n", "gi", "<CMD>FzfLua lsp_implementations<CR>", opts("Go to implementation"))
		vim.keymap.set("n", "gr", "<CMD>FzfLua lsp_references<CR>", opts("Go to references"))
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover documentation"))
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
		vim.keymap.set("n", "<leader>.", "<CMD>FzfLua lsp_code_actions<CR>", opts("Code actions"))
		vim.keymap.set("n", "<leader>,", "<CMD>FzfLua lsp_document_symbols<CR>", opts("Document symbols"))
		vim.keymap.set("n", "<leader>ws", "<CMD>FzfLua lsp_workspace_symbols<CR>", opts("Workspace symbols"))
	end,
})

---------------------------------------------------------
-- Keybindings
---------------------------------------------------------

vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Diagnostics (vim.diagnostic, not plugin-specific)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

---------------------------------------------------------
-- Other
---------------------------------------------------------

if vim.fn.argc() == 0 then
	require("oil").open()
end

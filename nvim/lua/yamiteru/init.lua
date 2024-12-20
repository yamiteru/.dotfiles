vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- No thank you
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Sharing is caring
vim.opt.clipboard = "unnamedplus"

-- Me SSD, me like not swap
vim.opt.swapfile = false

-- The only acceptable width
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- My style is going to blind you
vim.opt.background = "light"
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.fillchars = { eob = ' ' }

-- Show me thy numbers!
vim.opt.signcolumn = "yes:1"
vim.opt.number = false
vim.opt.relativenumber = true

-- Make your case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Mouse? I don't use rodents to navigate my code
vim.opt.mouse = ""

-- Arrows? Never heard of em!
-- vim.keymap.set("n", "<up>", "<nop>", { noremap = true })
-- vim.keymap.set("n", "<down>", "<nop>", { noremap = true })
-- vim.keymap.set("n", "<left>", "<nop>", { noremap = true })
-- vim.keymap.set("n", "<right>", "<nop>", { noremap = true })
-- vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
-- vim.keymap.set("i", "<down>", "<nop>", { noremap = true })
-- vim.keymap.set("i", "<left>", "<nop>", { noremap = true })
-- vim.keymap.set("i", "<right>", "<nop>", { noremap = true })
-- vim.keymap.set("c", "<up>", "<nop>", { noremap = true })
-- vim.keymap.set("c", "<down>", "<nop>", { noremap = true })
-- vim.keymap.set("c", "<left>", "<nop>", { noremap = true })
-- vim.keymap.set("c", "<right>", "<nop>", { noremap = true })

-- Pinky promise?
vim.keymap.set("n", "<leader>wc", "<C-W>c")
vim.keymap.set("n", "<leader>wv", "<C-W>v<C-W>l")
vim.keymap.set("n", "<leader>ws", "<C-W>s<C-W>j")

-- You haven't seen anything
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		signs = true,
		underline = true,
		virtual_text = false,
		update_in_insert = false
	}
)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd [[colorscheme tokyonight-day]]
		end
	},

	{
		"jghauser/mkdir.nvim"
	},

	{
		"max397574/better-escape.nvim",
		opts = {}
	},

	{
		"echasnovski/mini.move",
		opts = {}
	},

	{
		"echasnovski/mini.bracketed",
		opts = {}
	},

	{
		"echasnovski/mini.jump",
		opts = {}
	},

	{
		"echasnovski/mini.bufremove",
		opts = {}
	},

	{
		"echasnovski/mini.trailspace",
		opts = {}
	},

	-- TODO: extract settings here
	-- {
	-- 	"echasnovski/mini.basics",
	-- 	opts = {
	-- 		options = {
	-- 			basic = true,
	-- 			-- TODO: what does this do?
	-- 			extra_ui = true,
	-- 			-- TODO: what are the options?
	-- 			win_borders = 'solid',
	-- 		},
	-- 		mappings = {
	-- 			basic = true,
	-- 			option_toggle_prefix = [[\]],
	-- 			-- TODO: why does resize not work?
	-- 			windows = true,
	-- 			move_with_alt = true
	-- 		},
	-- 		autocommands = {
	-- 			basic = true,
	-- 			relnum_in_visual_mode = true
	-- 		},
	-- 		silent = true
	-- 	}
	-- },

	{
		-- TODO: how do I change the content?
		"echasnovski/mini.statusline",
		opts = {
			use_icons = false
		}
	},

	{
		"echasnovski/mini.surround",
		opts = {
			highlight_duration = 250,
			respect_selection_type = true,
			silent = true,
			-- TODO: how are search methods different?
			search_method = 'cover'
		}
	},

	{
		-- TODO: how to create a session file if it doesn't exist?
		"echasnovski/mini.sessions",
		opts = {
			autoread = true,
			verbose = {
				read = nil,
				write = nil,
				delete = nil
			}
		}
	},

	{
		"echasnovski/mini.splitjoin",
		opts = {
			detect = {
				brackets = { '%b()', '%b[]', '%b{}' },
				separator = ','
			}
		}
	},

	{
		"echasnovski/mini.comment",
		opts = {
			options = {
				ignore_blank_line = true
			}
		}
	},

	{
		"echasnovski/mini.cursorword",
		opts = {
			delay = 250
		}
	},

	{
		"echasnovski/mini.pairs",
		opts = {
			modes = {
				insert = true,
				command = true,
				terminal = true
			}
		}
	},

	-- TODO: why does the new version not work?
	-- {
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	opts = {
	-- 		log_level = "info",
	-- 		color = {
	-- 			suggestion_color = "#ffffff",
	-- 			cterm = 244,
	-- 		}
	-- 	}
	-- },

	{
		"shortcuts/no-neck-pain.nvim",
		opts = {
			width = 80,
			autocmds = {
				enableOnVimEnter = true,
				enableOnTabEnter = true,
				reloadOnColorSchemeChange = true,
				skipEnteringNoNeckPainBuffer = true
			},
			mappings = {
				enabled = true
			}
		}
	},

	{
		"cbochs/grapple.nvim",
		opts = {
			scope = "git_branch",
			icons = false,
			status = false,
			win_opts = {
				width = 0.75
			}
		},
		event = { "BufReadPost", "BufNewFile" },
		cmd = "Grapple",
		keys = {
			{ "<leader>m", "<cmd>Grapple toggle<cr>",          desc = "Grapple toggle tag" },
			{ "<leader>M", "<cmd>Grapple toggle_tags<cr>",     desc = "Grapple open tags window" },
			-- TODO: change to [ and ]
			{ "<leader>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
			{ "<leader>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
			{ "<c-h>",     "<cmd>Grapple select index=1<cr>",  desc = "Select first tag" },
			{ "<c-j>",     "<cmd>Grapple select index=2<cr>",  desc = "Select second tag" },
			{ "<c-k>",     "<cmd>Grapple select index=3<cr>",  desc = "Select third tag" },
			{ "<c-l>",     "<cmd>Grapple select index=4<cr>",  desc = "Select fourth tag" },
		},
	},

	{
		"folke/trouble.nvim",
		opts = {
			position = "bottom",
			mode = "document_diagnostics",
			severity = vim.diagnostic.severity.ERROR,
			padding = false,
			multiline = false
		},
		keys = {
			-- TODO: change keybindings
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim",  build = "make" },
			{ "nvim-telescope/telescope-file-browser.nvim" }
		},
		-- TODO: use more minimalist layout
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					file_browser = {
						hijack_netrw = true,
						quiet = true,
					},
				}
			})

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fv", builtin.git_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>ft", ":Telescope file_browser<CR>", {})
		end
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"ray-x/cmp-treesitter",
			"saadparwaiz1/cmp_luasnip",
			"octaltree/cmp-look",
			"mfussenegger/nvim-dap",
			"rcarriga/cmp-dap",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			require("mason").setup({
				pip = { upgrade_pip = true },
				max_concurrent_installers = 10,
				ui = {
					width = 0.75,
					height = 0.75,
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls"
				},
				automatic_installation = true,
			})

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabiities = capabilities
					})
				end
			})

			local cmp = require 'cmp'

			cmp.setup({
				preselect = cmp.PreselectMode.Item,
				keyword_length = 2,
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				view = {
					entries = {
						name = "custom",
						selection_order = "near_cursor",
						follow_cursor = true,
					},
				},
				mapping = {
					["<C-y>"] = cmp.mapping(
						cmp.mapping.confirm({
							select = true,
							behavior = cmp.ConfirmBehavior.Insert,
						}),
						{ "i", "c" }
					),
					["<C-n>"] = cmp.mapping.select_next_item({
						behavior = cmp.ConfirmBehavior.Insert,
					}),
					["<C-p>"] = cmp.mapping.select_prev_item({
						behavior = cmp.ConfirmBehavior.Insert,
					}),
					["<C-b>"] = cmp.mapping.scroll_docs(-5),
					["<C-f>"] = cmp.mapping.scroll_docs(5),
					["<C-q>"] = cmp.mapping.abort(),
				},
				matching = {
					disallow_fuzzy_matching = true,
					disallow_fullfuzzy_matching = true,
					disallow_partial_fuzzy_matching = true,
					disallow_partial_matching = false,
					disallow_prefix_unmatching = true,
				},
				sources = cmp.config.sources({
					{
						name = "luasnip",
						group_index = 1,
						option = { use_show_condition = true },
						entry_filter = function()
							local context = require("cmp.config.context")
							return not context.in_treesitter_capture("string")
									and not context.in_syntax_group("String")
						end,
					},
					{
						name = "nvim_lsp",
						group_index = 2,
					},
					{
						name = "treesitter",
						keyword_length = 4,
						group_index = 4,
					},
					{
						name = "path",
						keyword_length = 4,
						group_index = 4,
					},
					{
						name = "buffer",
						keyword_length = 3,
						group_index = 5,
					},
					{
						name = 'look',
						keyword_length = 2,
						group_index = 6,
						option = {
							convert_case = true,
							loud = true
						}
					},
					{
						name = "nvim_lsp_signature_help",
						max_item_count = 5,
						group_index = 6,
					},
				}),
				sorting = {
					priority_weight = 2,
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
				performance = {
					max_view_entries = 20,
				},
			})

			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				}),
				matching = { disallow_symbol_nonprefix_matching = false }
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local opts = { buffer = ev.buf }

					vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
					vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<space>f", function()
						vim.lsp.buf.format { async = true }
					end, opts)
				end,
			})
		end
	},

	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		init = function(plugin)
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
				}
			})
		end
	},
})

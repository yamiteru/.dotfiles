-- Who is your leader, peasant?!
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- No thank you
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Make your case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Mouse? I don't use rodents to navigate my code
vim.opt.mouse = ""

-- Arrows? Never heard of em!
vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })

-- Pinky promise?
vim.keymap.set("n", "<leader>wc", "<C-W>c")
vim.keymap.set("n", "<leader>wv", "<C-W>v<C-W>l")
vim.keymap.set("n", "<leader>ws", "<C-W>s<C-W>j")
vim.keymap.set("n", "<leader>wh", "<C-W>h")
vim.keymap.set("n", "<leader>wj", "<C-W>j")
vim.keymap.set("n", "<leader>wk", "<C-W>k")
vim.keymap.set("n", "<leader>wl", "<C-W>l")
vim.keymap.set("n", "<leader>wH", "<C-W>H")
vim.keymap.set("n", "<leader>wJ", "<C-W>J")
vim.keymap.set("n", "<leader>wK", "<C-W>K")
vim.keymap.set("n", "<leader>wL", "<C-W>L")

-- You haven't seen anything
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

vim.g.coq_settings = {
	auto_start = "shut-up",
	clients = {
		lsp = { enabled = true },
		tree_sitter = { enabled = true }
	},
	display = {
		ghost_text = { enabled = true }
	}
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		virtual_text = true,
		signs = true,
		update_in_insert = false,
		underline = true,
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
	"nvim-lua/plenary.nvim",
	"jghauser/mkdir.nvim",
	{ "max397574/better-escape.nvim", opts = {} },
	{ "echasnovski/mini.comment",     opts = { silent = true } },
	{ "echasnovski/mini.cursorword",  opts = { silent = true } },
	{ "echasnovski/mini.move",        opts = { silent = true } },
	{ "echasnovski/mini.pairs",       opts = { silent = true } },

	{
		"shortcuts/no-neck-pain.nvim",
		opts = {
			width = 85,
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
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame_opts = {
				delay = 0
			}
		},
		keys = {
			{ "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle git blame" }
		}
	},

	{
		"levouh/tint.nvim",
		opts = {
			tint = 75,
			saturation = 0,
			tint_background_colors = false
		}
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "day"
		},
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
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
			position = "right",
			mode = "document_diagnostics",
			severity = vim.diagnostic.severity.ERROR,
			padding = false,
			multiline = false
		},
		keys = {
			{ "<leader>tt", ":Trouble diagnostics<CR>" }
		}
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim",  build = "make" },
			{ "nvim-telescope/telescope-file-browser.nvim" }
		},
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
				},
				defaults = {
					sorting_strategy = "ascending",
					layout_strategy = "center",
					border = false,
					color_devicons = false,
					prompt_title = "",
					results_title = "",
					preview_title = "",
					prompt_prefix = "",
					selection_caret = "",
					entry_prefix = "",
					multi_icon = "",
					preview = { msg_bg_fillchar = ' ' },
					layout_config = {
						anchor = "N",
						width = 100,
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
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query"
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

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			{ "ms-jpq/coq_nvim",      branch = "coq",      event = "InsertEnter", cmd = "COQdeps" },
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
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

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					local capabilities = vim.lsp.protocol.make_client_capabilities()

					require("lspconfig")[server_name].setup({
						capabiities = capabilities,
						on_attach = function(client, bufnr)
							vim.lsp_attach_keybind(client, bufnr)
							return require("coq").lsp_ensure_capabilities()
						end
					})
				end
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
})

vim.o.cmdheight = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.o.background = 'light'
vim.o.showmode = false
vim.wo.relativenumber = true
vim.opt.number = true
vim.opt.showmatch = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.autowrite = true
vim.opt.autochdir = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. 'undo'
vim.g.mapleader = ' '
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.wrap = true
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.laststatus = 0
vim.o.signcolumn = "yes:1"

vim.g.coq_settings = {
	auto_start = 'shut-up',
	keymap = {
		pre_select = true
	},
	clients = {
		lsp = {
			enabled = true,
		},
		tree_sitter = {
			enabled = true,
		}
	},
	display = {
		ghost_text = {
			enabled = true
		}
	}
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		virtual_text = false,
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
	'jghauser/mkdir.nvim',
	{
		'nmac427/guess-indent.nvim',
		opts = {}
	},
	{
		'nvim-tree/nvim-tree.lua',
		config = function ()
			require("nvim-tree").setup({})

			vim.keymap.set('n', '<leader>nn', '<CMD>NvimTreeToggle<CR>', {})
		end
	},
	{
		"lewis6991/gitsigns.nvim",
		opst = {}
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
    dependencies = {
			'nvim-lua/plenary.nvim',
			'debugloop/telescope-undo.nvim',
			'cljoly/telescope-repo.nvim',
		},
		config = function ()
			require('telescope').setup({
				extensions = {
					undo = {},
					repo = {
						list = {
							search_dirs = {
								'~/dev',
							},
						}
					}
				},
			})

			require('telescope').load_extension('undo')
			require('telescope').load_extension('repo')

			local builtin = require('telescope.builtin')

			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fv', builtin.git_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
			vim.keymap.set('n', '<leader>fu', '<CMD>Telescope undo<CR>', {})
			vim.keymap.set('n', '<leader>fr', '<CMD>Telescope repo list<CR>', {})
		end
  },
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					keymap = { accept = '<S-CR>' }
				}
			})
		end,
	},
	{
		'shaunsingh/solarized.nvim',
		config = function ()
			require('solarized').set()
		end
	},
	{
		'max397574/better-escape.nvim',
		config = function ()
			require('better_escape').setup({})
		end
	},
	{
		'echasnovski/mini.comment',
		config = function ()
			require('mini.comment').setup({})
	   	end
	},
	{
		'echasnovski/mini.surround',
		config = function ()
			require('mini.surround').setup({})
		end
	},
	{
		'echasnovski/mini.pairs',
		config = function ()
			require('mini.pairs').setup({})
		end
	},
	{
		'echasnovski/mini.move',
		config = function ()
			require('mini.move').setup({})
		end
	},
	{
		'echasnovski/mini.hipatterns',
		config = function ()
			require('mini.hipatterns').setup({})
		end
	},
	{
		'echasnovski/mini.cursorword',
		config = function ()
			require('mini.cursorword').setup({})
		end
	},
	{
		"jackMort/ChatGPT.nvim",
			event = "VeryLazy",
			config = function()
				require("chatgpt").setup()
			end,
			dependencies = {
				"MunifTanjim/nui.nvim",
			}
	},
	{
		"https://git.sr.ht/~nedia/auto-save.nvim",
		event = { "BufReadPre" },
		opts = {
			events = { 'InsertLeave', 'BufLeave' },
			silent = true,
			exclude_ft = {}
		}
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			position = "right",
			mode = "document_diagnostics",
			use_diagnostic_signs = true
		}
	},
	{
    'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'windwp/nvim-ts-autotag',
			'nvim-treesitter/nvim-treesitter-context',
			'nvimdev/lspsaga.nvim',
			'nvim-tree/nvim-web-devicons'
		},
    cmd = 'TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = '<c-space>',
						node_incremental = '<c-space>',
						scope_incremental = '<c-s>',
						node_decremental = '<M-space>',
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							['aa'] = '@parameter.outer',
							['ia'] = '@parameter.inner',
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ac'] = '@class.outer',
							['ic'] = '@class.inner',
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							[']m'] = '@function.outer',
							[']]'] = '@class.outer',
						},
						goto_next_end = {
							[']M'] = '@function.outer',
							[']['] = '@class.outer',
						},
						goto_previous_start = {
							['[m'] = '@function.outer',
							['[['] = '@class.outer',
						},
						goto_previous_end = {
							['[M'] = '@function.outer',
							['[]'] = '@class.outer',
						},
					},
					swap = {
						enable = true,
						swap_next = {
							['<leader>a'] = '@parameter.inner',
						},
						swap_previous = {
							['<leader>A'] = '@parameter.inner',
						},
					},
				},
				ensure_installed = {
					'lua',
					'css',
					'gitignore',
					'html',
					'json',
					'markdown',
					'regex',
					'rust',
					'svelte',
					'sql',
					'toml',
					'tsx',
					'typescript',
					'javascript',
					'yaml',
				},
			})

			require('nvim-ts-autotag').setup({})
			require('treesitter-context').setup({})
			require('lspsaga').setup({})

			vim.keymap.set('n', '<leader>tu', '<CMD>TSUpdate<CR>', {})
			vim.keymap.set('n', '<leader>td', '<CMD>TSDisable<CR>', {})
			vim.keymap.set('n', '<leader>te', '<CMD>TSEnable<CR>', {})
			vim.keymap.set('n', '<leader>tt', '<CMD>TSToggle<CR>', {})
		end
  },
	{
		"williamboman/mason.nvim",
		dependencies = {
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{ "ms-jpq/coq_nvim", branch = "coq", event = "InsertEnter", cmd = "COQdeps" },
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig"
		},
		config = function ()
			require("mason").setup({})

			require("mason-lspconfig").setup_handlers({
				function (server_name)
					local capabilities = vim.lsp.protocol.make_client_capabilities()

					capabilities.textDocument.completion.completionItem.snippetSupport = true

					require("lspconfig")[server_name].setup({
						capabiities = capabilities,
						on_attach=function(client, bufnr)
							vim.lsp_attach_keybind(client, bufnr)
							return require('coq').lsp_ensure_capabilities()
						end
					})
				end
			})

			require("mason-lspconfig").setup({})

			vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<space>.', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<space>f', function()
						vim.lsp.buf.format { async = true }
					end, opts)
				end,
			})
		end
	}
}, {
	git = {
    timeout = 999999
  }
})


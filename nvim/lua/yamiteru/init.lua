vim.o.cmdheight = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.o.background = 'dark'
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

function lspconfig_config()
	local lsp = require('lsp-zero').preset({})
	local cmp = require('cmp')
	local cmp_action = require('lsp-zero').cmp_action()

	cmp.setup({
		mapping = {
			['<CR>'] = cmp.mapping.confirm({select = true}),
			['<Tab>'] = cmp_action.luasnip_supertab(),
			['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
		}
	})

	lsp.on_attach(function(client, bufnr)
		lsp.default_keymaps({buffer = bufnr})
	end)

	lsp.setup({})

	require('mason').setup({})
	require('mason-lspconfig').setup({
		ensure_installed = { 
			'lua_ls', 
			'cssls',
			'html',
			'dockerls',
			'eslint',
			'emmet_ls',
			'graphql',
			'jsonls',
			'tsserver',
			'remark_ls',
			'prismals',
			'pylsp',
			'sqlls',
			'stylelint_lsp',
			'svelte',
			'taplo',
			'tailwindcss',
			'yamlls',
			'zls',
			'rust_analyzer' 
		},
		automatic_installation = true
	})
end

function treesitter_config()
	require('nvim-treesitter.configs').setup({
		indent = { enable = true },
		ensure_installed = { 
			'lua',
			'css',
			'dockerfile',
			'gitattributes',
			'gitcommit',
			'gitignore',
			'go',
			'graphql',
			'html',
			'json',
			'markdown',
			'ocaml',
			'prisma',
			'regex',
			'rust',
			'svelte',
			'sql',
			'toml',
			'tsx',
			'typescript',
			'javascript',
			'yaml',
			'zig'
		},
		auto_install = true,
		highlight = {
			enable = true
		}
	})

	vim.keymap.set('n', '<leader>tu', '<CMD>TSUpdate<CR', {})
	vim.keymap.set('n', '<leader>td', '<CMD>TSDisable<CR', {})
	vim.keymap.set('n', '<leader>te', '<CMD>TSEnable<CR', {})
	vim.keymap.set('n', '<leader>tt', '<CMD>TSToggle<CR', {})
end

function telescope_config()
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

function devicons_config()
	require('nvim-web-devicons').setup({})
end

function dressing_config()
	require('dressing').setup({})
end

function neodim_config()
	require('neodim').setup({
		refresh_delay = 500,
		alpha = .75,
		blend_color = '#000000',
		hide = { underline = true, virtual_text = true, signs = true }
	})
end

function dapui_config()
	local dap, dapui = require('dap'), require('dapui')

	dap.listeners.after.event_initialized['dapui_config'] = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated['dapui_config'] = function()
		dapui.close()
	end

	dap.listeners.before.event_exited['dapui_config'] = function()
		dapui.close()
	end
end

function octo_config()
	require('octo').setup({})
end

function gitsigns_config()
	require('gitsigns').setup({})

	vim.keymap.set('n', '<leader>gl', '<CMD>Gitsigns blame_line<CR>', {})
	vim.keymap.set('n', '<leader>gt', '<CMD>Gitsigns toggle_signs<CR>', {})
	vim.keymap.set('n', '<leader>gr', '<CMD>Gitsigns refresh<CR>', {})
end

function better_escape_config()
	require('better_escape').setup({})
end

function neoscroll_config()
	require('neoscroll').setup({})
end

function auto_save_config()
	require('auto-save').setup({})
end

function treesitter_context_config()
	require('treesitter-context').setup({})
end

function comment_config()
	require('mini.comment').setup({})
end

function cursorword_config()
	require('mini.cursorword').setup({})
end

function pairs_config()
	require('mini.pairs').setup({})
end

function leetbuddy_config()
	require('leetbuddy').setup({
		language = 'ts',
	})

	vim.keymap.set('n', '<leader>lf', '<CMD>LBQuestions<CR>', {})
	vim.keymap.set('n', '<leader>ls', '<CMD>LBSubmit<CR>', {})
	vim.keymap.set('n', '<leader>lt', '<CMD>LBTest<CR>', {})
end

function nvimtree_config()
	require('nvim-tree').setup({})

	vim.keymap.set('n', '<leader>nn', '<CMD>NvimTreeToggle<CR>', {})
	vim.keymap.set('n', '<leader>nf', '<CMD>NvimTreeFocus<CR>', {})
end

function guess_indent_config()
	require('guess-indent').setup({})
end

function auto_session_config()
	require('auto-session').setup({})
end

function trouble_config()
	require('trouble').setup({})

	vim.keymap.set('n', '<leader>tt', '<CMD>TroubleToggle<CR>', {});
	vim.keymap.set('n', '<leader>td', '<CMD>Trouble document_diagnostics<CR>', {});
	vim.keymap.set('n', '<leader>tr', '<CMD>TroubleRefresh<CR>', {});
end

function lualine_config()
	require('lualine').setup({
		options = {
			theme = 'vscode',
			icons_enabled = false,
		}
	})
end

function vscode_config()
	require('vscode').setup({})
	require('vscode').load()
end

function neotest_config()
	require('neotest').setup({
		adapters = {
			require('neotest-vitest') 
		}
	})
end

function chatgpt_config()
	require('chatgpt').setup({})

	vim.keymap.set({'n', 'v'}, '<leader>cc', '<CMD>ChatGPT<CR>', {})
	vim.keymap.set({'n', 'v'}, '<leader>ca', '<CMD>ChatGPTActAs<CR>', {})
	vim.keymap.set({'n', 'v'}, '<leader>ce', '<CMD>ChatGPTEditWithInstructions<CR>', {})
	vim.keymap.set({'n', 'v'}, '<leader>crf', '<CMD>ChatGPTRun fix_bugs<CR>', {})
	vim.keymap.set({'n', 'v'}, '<leader>cro', '<CMD>ChatGPTRun optimize_code<CR>', {})
	vim.keymap.set({'n', 'v'}, '<leader>crd', '<CMD>ChatGPTRun docstring<CR>', {})
	vim.keymap.set({'n', 'v'}, '<leader>cra', '<CMD>ChatGPTRun code_readability_analyses<CR>', {})
end

function package_info_config()
	require('package-info').setup({})

	vim.keymap.set('n', '<leader>pi', '<CMD>PackageInfoInstall<CR>', {})
	vim.keymap.set('n', '<leader>pu', '<CMD>PackageInfoUpdate<CR>', {})
	vim.keymap.set('n', '<leader>pd', '<CMD>PackageInfoDelete<CR>', {})
	vim.keymap.set('n', '<leader>ps', '<CMD>PackageInfoShow<CR>', {})
	vim.keymap.set('n', '<leader>ph', '<CMD>PackageInfoHide<CR>', {})
	vim.keymap.set('n', '<leader>pv', '<CMD>PackageInfoChangeVersion<CR>', {})
end

function copilot_config()
	require('copilot').setup({
		suggestion = {
			auto_trigger = true,
			keymap = { accept = '<S-CR>' }
		}
	})
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'MunifTanjim/nui.nvim'
	use 'jghauser/mkdir.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'L3MON4D3/LuaSnip'
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			{'neovim/nvim-lspconfig'},             
			{'williamboman/mason.nvim'},          
			{'williamboman/mason-lspconfig.nvim'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		},
		config = lspconfig_config 
	}
	use {
		'nvim-tree/nvim-tree.lua',
		config = nvimtree_config
	}
	use {
		'Mofiqul/vscode.nvim',
		config = vscode_config
	}
	use {
		'vuki656/package-info.nvim',
		config = package_info_config
	}
	use {
		'nmac427/guess-indent.nvim',
		config = guess_indent_config
	}
	use {
		'jackMort/ChatGPT.nvim',
		config = chatgpt_config
	}
	-- TODO: doesn't work (no test suite found)
	-- TODO: add keymaps
	use {
		'nvim-neotest/neotest',
		requires = {
			'marilari88/neotest-vitest',
		},
		config = neotest_config
	}
	-- TODO: make it more minimalist
	use {
		'nvim-lualine/lualine.nvim',
		config = lualine_config
	}
	use {
		'folke/trouble.nvim',
		config = trouble_config
	}
	use {
		'Pocco81/auto-save.nvim',
		config = auto_save_config
	}
	use {
		'rmagatti/auto-session',
		config = auto_session_config
	}
	use {
		'max397574/better-escape.nvim',
		config = better_escape_config
	}
	-- TODO: add keymaps
	use {
		'pwntester/octo.nvim',
		config = octo_config
	}
	use {
		'lewis6991/gitsigns.nvim',
		config = gitsigns_config
	}
	-- TODO: add keymaps
	use {
		'mfussenegger/nvim-dap',
		requires = {
			'rcarriga/nvim-dap-ui',
		},
		config = dapui_config
	}
	-- TODO: test if it works
	use {
		'stevearc/dressing.nvim',
		config = dressing_config
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = treesitter_config
  }
	use {
		'nvim-treesitter/nvim-treesitter-context',
		config = treesitter_context_config
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'debugloop/telescope-undo.nvim',
			'cljoly/telescope-repo.nvim',
		},
		config = telescope_config
	}
	use {
		'echasnovski/mini.comment',
		config = comment_config
	}
	use {
		'echasnovski/mini.cursorword',
		config = cursorword_config
	}
	use {
		'echasnovski/mini.pairs',
		config = pairs_config
	}
	use {
	  'zbirenbaum/neodim',
	  event = 'LspAttach',
	  branch = 'v2',
	  config = neodim_config
	}
	use {
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		config = copilot_config,
	}
	use {
		'Dhanus3133/Leetbuddy.nvim',
		config = leetbuddy_config
	}
end)


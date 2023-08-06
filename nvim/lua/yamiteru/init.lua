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
vim.g.coq_settings = { auto_start = 'shut-up' }

function mason_config()
	require('mason').setup()
	require('mason-tool-installer').setup({
	  ensure_installed = {
		  'zls',
		  'zk',
		  'yaml-language-server',
		  'typescript-language-server',
		  'tailwindcss-language-server',
		  'svelte-language-server',
		  'stylelint-lsp',
		  'rust-analyzer',
		  'prisma-language-server',
		  'lua-language-server',
		  'json-lsp',
		  'html-lsp',
		  'eslint-lsp',
		  'emmet-ls',
		  'dockerfile-language-server',
		  'docker-compose-language-service',
		  'diagnostic-languageserver',
		  'css-lsp',
		  'gopls',
		  'ocaml-lsp',
		  'js-debug-adapter',
		  'go-debug-adapter',
		  'stylelint',
		  'markdownlint',
		  'editorconfig-checker',
		  'codespell',
		  'commitlint',
		  'eslint_d',
		  'golangci-lint',
		  'jsonlint',
		  'luacheck',
		  'markuplint',
		  'sonarlint-language-server',
		  'yamllint',
		  'prettier',
		  'rustywind'

	  },
	  auto_update = true,
	  run_on_start = true,
	  start_delay = 3000,
	  debounce_hours = 24,
	})
end

function lspconfig_config()
	local lsp = require('lspconfig')
	local coq = require('coq')

	lsp.tsserver.setup()
	lsp.tsserver.setup(coq.lsp_ensure_capabilities())

	vim.api.nvim_create_autocmd('LspAttach', {
	  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	  callback = function(ev)
	    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

	    local opts = { buffer = ev.buf }
	    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
	    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
	    vim.keymap.set({ 'n', 'v' }, '<leader>.', vim.lsp.buf.code_action, opts)
	    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	  end,
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
	require('nvim-web-devicons').setup()
end

function dressing_config()
	require('dressing').setup()
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
	require('octo').setup()
end

function gitsigns_config()
	require('gitsigns').setup()
end

function better_escape_config()
	require('better_escape').setup()
end

function neoscroll_config()
	require('neoscroll').setup()
end

function auto_save_config()
	require('auto-save').setup()
end

function treesitter_context_config()
	require('treesitter-context').setup()
end

function comment_config()
	require('mini.comment').setup()
end

function cursorword_config()
	require('mini.cursorword').setup()
end

function pairs_config()
	require('mini.pairs').setup()
end

function leetbuddy_config()
	require('leetbuddy').setup({
		language = 'ts',
	})
end

function nvimtree_config()
	require('nvim-tree').setup()
end

function guess_indent_config()
	require('guess-indent').setup()
end

function auto_session_config()
	require('auto-session').setup()
end

function trouble_config()
	require('trouble').setup()
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
	require('vscode').setup()
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
	require('chatgpt').setup()
end

function package_info_config()
	require('package-info').setup()
end

function hydra_config()
	local Hydra = require('hydra')
end

function copilot_config()
	require('copilot').setup()
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'MunifTanjim/nui.nvim'
	use 'jghauser/mkdir.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'L3MON4D3/LuaSnip'
	use {
		'nvim-tree/nvim-tree.lua',
		config = nvimtree_config
	}
	use {
		'Mofiqul/vscode.nvim',
		config = vscode_config
	}
	-- TODO: add keymaps with hydra
	use {
		'vuki656/package-info.nvim',
		config = package_info_config
	}
	use {
		'nmac427/guess-indent.nvim',
		config = guess_indent_config
	}
	-- TODO: add keymaps with hydra
	use {
		'jackMort/ChatGPT.nvim',
		config = chatgpt_config
	}
	-- TODO: doesn't work but should be fixed once LSP works
	-- TODO: add keymaps with hydra
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
	-- TODO: test if it works
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
	-- TODO: add keymaps with hydra
	use {
		'pwntester/octo.nvim',
		config = octo_config
	}
	-- TODO: add keymaps with hydra
	use {
		'lewis6991/gitsigns.nvim',
		config = gitsigns_config
	}
	-- TODO: test if it works
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
	-- TODO: add keymaps with hydra
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = treesitter_config
  }
	use {
		'nvim-treesitter/nvim-treesitter-context',
		config = treesitter_context_config
	}
	-- TODO: add keymaps with hydra
	use {
	  'williamboman/mason.nvim',
		requires = {
			'williamboman/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',
		},
		config = mason_config
	}
	-- TODO: doesn't work
	use {
		'neovim/nvim-lspconfig',
		'ms-jpq/coq_nvim',
		config = lspconfig_config
	}
	-- TODO: add more keymaps
	-- TODO: rewrite keymaps to hydra
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
	-- TODO: doesn't work but should be fixed once LSP works
	use {
	  'zbirenbaum/neodim',
	  event = 'LspAttach',
	  branch = 'v2',
	  config = neodim_config
	}
	-- TODO: doesn't suggest anything
	use {
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		config = copilot_config,
	}
	-- TODO: add keymaps with hydra
	use {
		'Dhanus3133/Leetbuddy.nvim',
		config = leetbuddy_config
	}
	use {
		'anuvyklack/hydra.nvim',
		config = hydra_config
	}
end)


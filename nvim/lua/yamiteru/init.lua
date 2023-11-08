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
		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'buffer' },
			{ name = 'path' }
    },
		mapping = {
			['<CR>'] = cmp.mapping.confirm({select = true}),
			['<Tab>'] = cmp_action.luasnip_supertab(),
			['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
    },
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end
    }
	})

	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
	vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
	vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

	lsp.on_attach(function(client, bufnr)
		lsp.default_keymaps({buffer = bufnr})
	end)

	require('mason').setup()
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
			'marksman',
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

	lsp.setup({})
end

function treesitter_config()
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
	})

	vim.keymap.set('n', '<leader>tu', '<CMD>TSUpdate<CR>', {})
	vim.keymap.set('n', '<leader>td', '<CMD>TSDisable<CR>', {})
	vim.keymap.set('n', '<leader>te', '<CMD>TSEnable<CR>', {})
	vim.keymap.set('n', '<leader>tt', '<CMD>TSToggle<CR>', {})
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

function neodim_config()
	require('neodim').setup({
		refresh_delay = 2500,
		alpha = .5,
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
		language = 'rs',
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
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
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

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<Leader>,', ':nohlsearch<CR>')
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('i', 'jk', '<ESC>')

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set('n', '<leader>wc', '<C-W>c')
vim.keymap.set('n', '<leader>wv', '<C-W>v')
vim.keymap.set('n', '<leader>ws', '<C-W>s')
vim.keymap.set('n', '<leader>wh', '<C-W>h')
vim.keymap.set('n', '<leader>wj', '<C-W>j')
vim.keymap.set('n', '<leader>wk', '<C-W>k')
vim.keymap.set('n', '<leader>wl', '<C-W>l')
vim.keymap.set('n', '<leader>wH', '<C-W>H')
vim.keymap.set('n', '<leader>wJ', '<C-W>J')
vim.keymap.set('n', '<leader>wK', '<C-W>K')
vim.keymap.set('n', '<leader>wL', '<C-W>L')

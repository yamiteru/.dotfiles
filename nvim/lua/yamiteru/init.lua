vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

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
vim.opt.undodir = vim.fn.stdpath("data") .. "undo"

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

vim.g.mapleader = ' '

function solarized_config()
	require('solarized').set()
end

function lualine_config()
	require('lualine').setup {
		options = { theme = 'solarized' }
	}
end

function tree_sitter_config()
	require('nvim-treesitter.configs').setup {
		indent = { enable = true },
		autopairs = { enable = true },
		highlight = {
			enable = true,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
		},
		ensure_installed = {
			'lua',
			'css',
			'dockerfile',
			'gitattributes',
			'gitcommit',
			'gitignore',
			'html',
			'jsdoc',
			'markdown',
			'rust',
			'javascript',
			'typescript',
			'markdown',
			'svelte',
			'tsx',
		}
	}
end

function mason_config()
	require('mason').setup()
end

function mason_installer_config()
	require('mason-tool-installer').setup {
		start_delay = 5000,
		debounce_hours = 24,
		ensure_installed = {
			'lua-language-server',
			'editorconfig-checker',
			'css-lsp',
			'docker-compose-language-service',
			'emmet-ls',
			'eslint-lsp',
			'html-lsp',
			'json-lsp',
			'markdownlint',
			'prettier',
			'rust-analyzer',
			'stylelint',
			'svelte-language-server',
			'typescript-language-server',
		}
	}
end

function auto_save_config()
	require('auto-save').setup() 
end

function git_config()
	require('git').setup { default_mappings = true }
end

function comment_config()
	require('Comment').setup()
end

function nvim_tree_config()
	require('nvim-tree').setup {
		sort_by = 'case_sensitive',
		view = {
			width = 40,
		},
		filters = {
			dotfiles = true,
		}
	}
end

function grapple_config()
	require('grapple').setup()
end

function telescope_config()
	require("telescope").setup()
	require("telescope").load_extension("ui-select")
end

function copilot_config()
	require('copilot').setup {
		filetypes = {
			["."] = true,
		},
		suggestion = {
			auto_trigger = true,
			keymap = {
				accept = "<leader><CR>",
			},
		}
	}
end

function autopairs_config() 
	require("nvim-autopairs").setup { check_ts = true }
end

require('packer').startup(function(use)
	-- Core
  use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	
	-- Look 
	use {
		'shaunsingh/solarized.nvim',
		config = solarized_config
	}
	use {
		'nvim-lualine/lualine.nvim',
		config = lualine_config
	}
	use 'nvim-tree/nvim-web-devicons'
	use {
		'nvim-treesitter/nvim-treesitter',
		config = tree_sitter_config
	}

	-- LSP
	use {
		'neoclide/coc.nvim',
		branch = 'master',
		run = 'yarn install --frozen-lockfile'
	}
	use 'neovim/nvim-lspconfig'
  use 'williamboman/mason-lspconfig.nvim'
	use {
		'williamboman/mason.nvim',
		config = mason_config
	}
	use {
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		config = mason_installer_config
	}
	
	-- Other
	use 'jghauser/mkdir.nvim'
	use {
		'Pocco81/auto-save.nvim',
		config = auto_save_config
	}
	use {
		'dinhhuy258/git.nvim',
		config = git_config
	}
	use 'gpanders/editorconfig.nvim'
	use {
		'numToStr/Comment.nvim',
		config = comment_config
	}
	use {
		'nvim-tree/nvim-tree.lua',
		config = nvim_tree_config
	}
	use {
		'cbochs/grapple.nvim',
		config = grapple_config
	}
	use 'nvim-telescope/telescope-ui-select.nvim'
	use {
		'nvim-telescope/telescope.nvim',
		config = telescope_config
	}
  use {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = copilot_config
  }
	use {
    "windwp/nvim-autopairs",
    config = autopairs_config
  }
end)

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- Core
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<Leader>,', ':nohlsearch<CR>')
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('i', 'jk', '<ESC>')

-- Window
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

-- CoC
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)')
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)')
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)')
vim.keymap.set('n', 'gr', '<Plug>(coc-references)')
vim.keymap.set('n', 'K', ':call CocActionAsync("doHover")<CR>')
vim.keymap.set('n', '<leader>.', '<Plug>(coc-codeaction)')
vim.keymap.set('n', '<leader>cr', '<Plug>(coc-rename)')
vim.keymap.set('n', '<leader>co', ':<C-u>CocList outline<CR>')
vim.keymap.set('n', '<leader>cs', ':<C-u>CocList -I symbols<CR>')
vim.keymap.set('n', '<leader>cc', ':<C-u>CocList commands<CR>')
vim.keymap.set('n', '<leader>cc', ':<C-u>CocRestart<CR>')
vim.keymap.set('i', '<C-Space>', 'coc#refresh()', opts)
vim.keymap.set('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : "<TAB>"', opts)
vim.keymap.set('i', '<S-TAB>', 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', opts)
vim.keymap.set('i', '<S-CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- NvimTree
vim.keymap.set('n', 'to', ':NvimTreeFocus<CR>')
vim.keymap.set('n', 'tt', ':NvimTreeToggle<CR>')
vim.keymap.set('n', 'tf', ':NvimTreeFindFile<CR>')

-- Grapple
vim.keymap.set('n', 'mf', ':GrapplePopup tags<CR>')
vim.keymap.set('n', 'ma', ':GrappleTag<CR>')
vim.keymap.set('n', 'md', ':GrappleUntag<CR>')
vim.keymap.set('n', 'mh', ':GrappleCycle backward<CR>')
vim.keymap.set('n', 'ml', ':GrappleCycle forward<CR>')
vim.keymap.set('n', 'mr', ':GrappleReset<CR>')
vim.keymap.set('n', '<leader>h', ':GrappleSelect key=1<CR>')
vim.keymap.set('n', '<leader>j', ':GrappleSelect key=2<CR>')
vim.keymap.set('n', '<leader>k', ':GrappleSelect key=3<CR>')
vim.keymap.set('n', '<leader>l', ':GrappleSelect key=4<CR>')

-- Telescope
vim.keymap.set('n', 'ff', ':Telescope find_files<CR>')
vim.keymap.set('n', 'fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', 'fb', ':Telescope buffers<CR>')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

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

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.wrap = true

vim.g.mapleader = ' '

function solarized_config()
	require('solarized').set()
end

function lualine_config()
	require('lualine').setup {
		options = { theme = 'solarized' },
		sections = {
			lualine_c = {
				{
					'filename',
					file_status = true,
					path = 2
				}
			}
		}
	}
end

function tree_sitter_config()
	require('nvim-treesitter.configs').setup {
		sync_install = false,
		auto_install = true,
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<space>",
				node_incremental = "<space>",
				node_decremental = "<bs>",
				scope_incremental = "<tab>",
			},
		},
		autopairs = {
			enable = true,
		},
		highlight = {
			enable = true,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
		ensure_installed = {
			'c',
			'cpp',
			'commonlisp',
			'dart',
			'bash',
			'lua',
			'css',
			'dockerfile',
			'gitattributes',
			'go',
			'graphql',
			'gitcommit',
			'gitignore',
			'html',
			'jsdoc',
			'markdown',
			'ocaml',
			'prisma',
			'python',
			'r',
			'regex',
			'rust',
			'sql',
			'javascript',
			'typescript',
			'markdown',
			'svelte',
			'vue',
			'zig',
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
			'bash-language-server',
			'lua-language-server',
			'editorconfig-checker',
			'css-lsp',
			'cssmodules-language-server',
			'docker-compose-language-service',
			'dockerfile-language-server',
			'editorconfig-checker',
			'emmet-ls',
			'eslint-lsp',
			'html-lsp',
			'json-lsp',
			'markdownlint',
			'prettier',
			'prisma-language-server',
			'rust-analyzer',
			'stylelint',
			'svelte-language-server',
			'tailwindcss-language-server',
			'typescript-language-server',
			'yaml-language-server',
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

function lastplace_config()
	require("nvim-lastplace").setup {
		lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
		lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
		lastplace_open_folds = true
	}
end

function nvim_tree_config()
	require('nvim-tree').setup {
		sort_by = 'case_sensitive',
		filters = {
			dotfiles = true,
		}
	}
end

function grapple_config()
	require('grapple').setup()
end

function telescope_config()
	require("telescope").setup {
		extensions = {
			fzf = {
				fuzzy = true,  
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case"
			}
		}
	}

	require('telescope').load_extension('fzf')
	require("telescope").load_extension("ui-select")
end

function copilot_config()
	require('copilot').setup {
		filetypes = {
			javascript = true,
			typescript = true,
		},
		suggestion = {
			auto_trigger = true
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
    "ethanholz/nvim-lastplace",
    config = lastplace_config,
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
    "nvim-telescope/telescope-fzf-native.nvim", 
		run = 'make' 
  }
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

vim.api.nvim_create_autocmd("TermOpen", {
	command = [[setlocal nonumber norelativenumber]]
})

local keybind = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }
local nse = { noremap = true, silent = true, expr = true }

-- Core
keybind('n', '<Leader>s', ':w!<CR>', ns)
keybind('n', '<Leader>q', ':q!<CR>', ns)

keybind('n', '<Up>', 'gk', ns)
keybind('n', '<Down>', 'gj', ns)

keybind('n', 'Y', 'y$', ns)

keybind('v', 'J', ":m '>+1<CR>gv=gv", ns)
keybind('v', 'K', ":m '<-2<CR>gv=gv", ns)

keybind('n', '<leader>wc', '<C-W>c', ns)
keybind('n', '<leader>wv', '<C-W>v', ns)
keybind('n', '<leader>ws', '<C-W>s', ns)
keybind('n', '<leader>wh', '<C-W>h', ns)
keybind('n', '<leader>wj', '<C-W>j', ns)
keybind('n', '<leader>wk', '<C-W>k', ns)
keybind('n', '<leader>wl', '<C-W>l', ns)
keybind('n', '<leader>wH', '<C-W>H', ns)
keybind('n', '<leader>wJ', '<C-W>J', ns)
keybind('n', '<leader>wK', '<C-W>K', ns)
keybind('n', '<leader>wL', '<C-W>L', ns)

keybind('v', '<leader>y', '"+y', ns)
keybind('n', '<leader>Y', '"+yg_', ns)
keybind('n', '<leader>y', '"+y', ns)
keybind('n', '<leader>yy', '"+yy', ns)
keybind('n', '<leader>p', '"+p', ns)
keybind('n', '<leader>P', '"+P', ns)
keybind('v', '<leader>p', '"+p', ns)
keybind('v', '<leader>P', '"+P', ns)

keybind("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], ns)
keybind('n', '<Leader>,', ':nohlsearch<CR>', ns)

keybind('i', 'j', 'gj', ns)
keybind('i', 'k', 'gk', ns)
keybind('i', 'jj', '<ESC>', ns)
keybind('i', 'jk', '<ESC>', ns)

keybind('t', '<leader>q', '<C-\\><C-n>:q<cr>', ns)
keybind('t', '<ESC>', '<C-\\><C-n>', ns)
keybind('n', '<leader>tv', '<cmd>vnew<CR>', ns)
keybind('n', '<leader>ts', '<cmd>split<CR>', ns)
keybind('t', '<leader>tv', '<c-w><cmd>vnew<CR>', ns)
keybind('t', '<leader>ts', '<c-w><cmd>split<CR>', ns)
keybind('t', '<C-h>', '<C-\\><C-n><C-w>h', ns)
keybind('t', '<C-j>', '<C-\\><C-n><C-w>j', ns)
keybind('t', '<C-k>', '<C-\\><C-n><C-w>k', ns)
keybind('t', '<C-l>', '<C-\\><C-n><C-w>l', ns)

-- CoC
keybind('n', 'gd', '<Plug>(coc-definition)', ns)
keybind('n', 'gy', '<Plug>(coc-type-definition)', ns)
keybind('n', 'gi', '<Plug>(coc-implementation)', ns)
keybind('n', 'gr', '<Plug>(coc-references)', ns)
keybind('n', 'K', ':call CocActionAsync("doHover")<CR>', ns)
keybind('n', '<leader>.', '<Plug>(coc-codeaction)', ns)
keybind('n', '<leader>cr', '<Plug>(coc-rename)', ns)
keybind('n', '<leader>co', ':<C-u>CocList outline<cr>', ns)
keybind('n', '<leader>cs', ':<C-u>CocList -I symbols<cr>', ns)
keybind('n', '<leader>cl', ':<C-u>CocList locationlist<cr>', ns)
keybind('n', '<leader>cc', ':<C-u>CocList commands<cr>', ns)
keybind('n', '<leader>cR', ':<C-u>CocRestart<cr>', ns)
keybind('n', '<leader>cx', ':<C-u>CocList extensions<cr>', ns)
keybind('n', '<leader>ce', ':CocCommand eslint.executeAutofix<CR>', ns)
keybind('n', '<leader>cp', ':CocCommand prettier.formatFile<CR>', ns)
keybind('i', '<C-Space>', 'coc#refresh()', nse)
keybind('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : "<TAB>"', nse)
keybind('i', '<S-TAB>', 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', nse)
keybind('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "<C-G>u<CR><C-R>=coc#on_enter()<CR>"', nse)

-- NvimTree
keybind('n', '<leader>to', ':NvimTreeFocus<cr>', ns)
keybind('n', '<leader>tt', ':NvimTreeToggle<cr>', ns)
keybind('n', '<leader>tf', ':NvimTreeFindFile<cr>', ns)

-- Grapple
keybind('n', '<leader>mf', 'grapple#popup_tags()', nse)
keybind('n', '<leader>ms', 'grapple#popup_scopes()', nse)
keybind('n', '<leader>ma', 'grapple#tag()', nse)
keybind('n', '<leader>md', 'grapple#untag()', nse)
keybind('n', '<leader>mh', 'grapple#cycle_backward()', nse)
keybind('n', '<leader>ml', 'grapple#cycle_forward()', nse)
keybind('n', '<leader>mr', 'grapple#reset()', nse)
keybind('n', '<leader>h', 'grapple#select({ key = 1 })', nse)
keybind('n', '<leader>j', 'grapple#select({ key = 2 })', nse)
keybind('n', '<leader>k', 'grapple#select({ key = 3 })', nse)
keybind('n', '<leader>l', 'grapple#select({ key = 4 })', nse)

-- Telescope
keybind('n', '<leader>ff', '<cmd>Telescope find_files<cr>', ns)
keybind('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', ns)
keybind('n', '<leader>fb', '<cmd>Telescope buffers<cr>', ns)
keybind('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', ns)
keybind('n', '<leader>fi', '<cmd>Telescope git_files<cr>', ns)
keybind('n', '<leader>ft', '<cmd>Telescope treesitter<cr>', ns)

vim.g.mapleader = ' '
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.termguicolors = true
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.wo.number = true
vim.wo.relativenumber = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('packer').startup(function(use)
	-- Core
  use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	
	-- Look 
	use {
		'shaunsingh/solarized.nvim',
		config = function()
			require('solarized').set()
		end
	}
	use {
		'nvim-lualine/lualine.nvim',
		config = function()
			require('lualine').setup({
				options = {
					theme = 'solarized'
				}	
			})
		end
	}
	use 'nvim-tree/nvim-web-devicons'
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup {
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true
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
		config = function()
			require('mason').setup()
		end
	}
	use {
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		config = function()
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
	}
	
	-- Other
	use 'jghauser/mkdir.nvim'
	use {
		'Pocco81/auto-save.nvim',
		config = function()
			require('auto-save').setup() 
		end
	}
	use 'gpanders/editorconfig.nvim'
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	use {
		'nvim-tree/nvim-tree.lua',
		config = function()
			require('nvim-tree').setup({
				sort_by = 'case_sensitive',
			})
		end
	}
	use {
		'cbochs/grapple.nvim',
		config = function()
			require('grapple').setup()
		end
	}
	use 'nvim-telescope/telescope.nvim'
  use {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
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
  }
end)

local keybind = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }
local nse = { noremap = true, silent = true, expr = true }

-- Core
keybind('n', '<leader>wh', '<C-W>h', ns)
keybind('n', '<leader>wj', '<C-W>j', ns)
keybind('n', '<leader>wk', '<C-W>k', ns)
keybind('n', '<leader>wl', '<C-W>l', ns)
keybind('n', '<leader>wH', '<C-W>H', ns)
keybind('n', '<leader>wJ', '<C-W>J', ns)
keybind('n', '<leader>wK', '<C-W>K', ns)
keybind('n', '<leader>wL', '<C-W>L', ns)
keybind('n', '<leader>wc', '<C-W>c', ns)
keybind('n', '<leader>wv', '<C-W>v', ns)
keybind('n', '<leader>ws', '<C-W>s', ns)

keybind('v', '<leader>y', '"+y', ns)
keybind('n', '<leader>Y', '"+yg_', ns)
keybind('n', '<leader>y', '"+y', ns)
keybind('n', '<leader>yy', '"+yy', ns)
keybind('n', '<leader>p', '"+p', ns)
keybind('n', '<leader>P', '"+P', ns)
keybind('v', '<leader>p', '"+p', ns)
keybind('v', '<leader>P', '"+P', ns)

keybind('i', 'jk', '<esc>l', ns)

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

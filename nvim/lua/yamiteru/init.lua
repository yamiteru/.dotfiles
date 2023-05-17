vim.g.mapleader = ' '

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'jghauser/mkdir.nvim'
	use 'shaunsingh/solarized.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'cbochs/grapple.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'gpanders/editorconfig.nvim'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
	use 'tpope/vim-repeat'
	use 'ggandor/leap.nvim'
	use 'Pocco81/auto-save.nvim'
	use 'numToStr/Comment.nvim'
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        filetypes = {
          javascript = true,
          typescript = true,
        },
        suggestion = {
          auto_trigger = true,
        },
      })
    end,
  }
	use {
		'neoclide/coc.nvim', 
		branch = 'master', 
		run = 'yarn install --frozen-lockfile'
	}	
end)

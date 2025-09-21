-- TODO: get rid of the warning "Undefined global `vim`."
-- TODO: add file name info somewhere so I know where the current file I'm looking at is located
-- TODO: show errors in a popup
-- TODO: goto references/declarations/implementations

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- No status line
vim.opt.laststatus = 3
vim.o.ls = 0
vim.o.stl = "%{repeat(' ',winwidth('.'))}"
vim.o.cmdheight = 0

-- No thank you
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Sharing is caring
vim.opt.clipboard = "unnamedplus"

-- Me SSD, me like not swap
vim.opt.swapfile = false

-- The only acceptable width
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.o.completeopt = "menuone,noinsert,popup,fuzzy"

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Show me thy numbers!
vim.opt.signcolumn = "yes:1"
vim.opt.number = false
vim.opt.relativenumber = false

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

vim.opt.diffopt:append("linematch:60")

vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Mouse? I don't use rodents to navigate my code
vim.opt.mouse = ""

-- You haven't seen anything
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- Make your case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- My style is going to blind you
vim.opt.background = "light"
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.fillchars = {
	eob = ' ',
	horiz = ' ',
	horizup = ' ',
	horizdown = ' ',
	vert = ' ',
	vertleft = ' ',
	vertright = ' ',
	verthoriz = ' ',
	fold = ' ',
	foldopen = ' ',
	foldclose = ' ',
	foldsep = ' ',
	diff = ' ',
	lastline = ' ',
}

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = true,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✗",
      [vim.diagnostic.severity.WARN] = "⚠",
      [vim.diagnostic.severity.INFO] = "ℹ",
      [vim.diagnostic.severity.HINT] = "💡",
    }
  }
})

vim.pack.add({"https://github.com/nvim-lua/plenary.nvim"})

vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main"
	}
})
require("nvim-treesitter.configs").setup({
	indent = {
		enable = true
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
})
-- TODO: how to trigger this?
-- vim.cmd "TSUpdate"

vim.pack.add({ "https://github.com/echasnovski/mini.move" })
require('mini.move').setup()

vim.pack.add({"https://github.com/echasnovski/mini.hipatterns"})
require('mini.hipatterns').setup()

vim.pack.add({ "https://github.com/echasnovski/mini.cursorword" })
require('mini.cursorword').setup()

vim.pack.add({ "https://github.com/echasnovski/mini.bracketed" })
require('mini.bracketed').setup()

vim.pack.add({ "https://github.com/echasnovski/mini.pairs" })
require('mini.pairs').setup()

vim.pack.add({ "https://github.com/echasnovski/mini.splitjoin" })
require('mini.splitjoin').setup()

vim.pack.add({ "https://github.com/echasnovski/mini.surround" })
require('mini.surround').setup()

vim.pack.add({ "https://github.com/echasnovski/mini.trailspace" })
require('mini.trailspace').setup()

vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup({
	default_file_explorer = true,
	columns = {},
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	watch_for_changes = true,
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 5000,
		autosave_changes = true,
	},
	keymaps = {
		["<M-h>"] = "actions.select_split",
	},
	view_options = {
		show_hidden = true,
		natural_order = true,
	}
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>")

vim.pack.add({"https://github.com/nvim-focus/focus.nvim"})
require("focus").setup()

vim.pack.add({"https://github.com/miversen33/sunglasses.nvim"})
require("sunglasses").setup({
    filter_type = "NOSYNTAX",
    filter_percent = .4
})

vim.pack.add({"https://github.com/folke/tokyonight.nvim"})
vim.cmd[[colorscheme tokyonight-day]]

vim.pack.add({"https://github.com/ibhagwan/fzf-lua"})
require("fzf-lua").setup()

vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files<CR>")
vim.keymap.set("n", "<leader>fb", "<CMD>FzfLua buffers<CR>")
vim.keymap.set("n", "<leader>fg", "<CMD>FzfLua live_grep<CR>")

vim.pack.add({
	{
		src = "https://github.com/Saghen/blink.cmp",
		version = vim.version.range("1.*")
	}
})
require("blink.cmp").setup({
	keymap = {
		preset = 'default'
	},
	completion = {
		documentation = {
			auto_show = true
		}
	},
	sources = {
      default = {
      	'lsp',
      	'path',
      	'snippets',
      	'buffer'
      },
    },
	fuzzy = {
		implementation = "prefer_rust",
		prebuilt_binaries = {
			force_version = "1.7.0"
		}
	}
})

vim.pack.add({"https://github.com/neovim/nvim-lspconfig"})
vim.pack.add({"https://github.com/mason-org/mason-lspconfig.nvim"})
vim.pack.add({"https://github.com/mason-org/mason.nvim"})

require("mason").setup()

local capabilities = require("blink.cmp").get_lsp_capabilities()

require("mason-lspconfig").setup({
	ensure_installed = {},
	automatic_installation = true,
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities
			})
		end
	}
})

vim.pack.add({"https://github.com/folke/trouble.nvim"})
require("trouble").setup({})

vim.g.lspTimeoutConfig = {
    stopTimeout  = 1000 * 60 * 5,
    startTimeout = 0,
    silent       = true
}

vim.pack.add({"https://github.com/hinell/lsp-timeout.nvim"})

-- TODO: find a better folding plugin
-- autoFold doens't work
vim.pack.add({"https://github.com/chrisgrieser/nvim-origami"})
require("origami").setup({
	autoFold = {
		enabled = true,
		-- This doesn't work for some reason
		kinds = { "comment", "imports" },
	},
})

vim.pack.add({"https://github.com/jghauser/mkdir.nvim"})

vim.pack.add({"https://github.com/chrisgrieser/nvim-early-retirement"})
require("early-retirement").setup({
	retirementAgeMins = 5,
	ignoreUnsavedChangesBufs = false,
	ignoreVisibleBufs = false,
	deleteBufferWhenFileDeleted = true
})

local excluded_filetypes = {
  "gitcommit",
  "Trouble",
  "oil",
  "prompt",
  "toggleterm",
}

local function save_condition(buf)
  if
    vim.tbl_contains(excluded_filetypes, vim.fn.getbufvar(buf, "&filetype")) or vim.fn.getbufvar(buf, "&buftype") ~= ''
  then
    return false
  end
  return true
end

vim.pack.add({"https://github.com/okuuva/auto-save.nvim"})
require("auto-save").setup({
	debounce_delay = 5000,
	condition = save_condition
})

vim.pack.add({"https://github.com/shortcuts/no-neck-pain.nvim"})
require("no-neck-pain").setup()

vim.pack.add({"https://github.com/abecodes/tabout.nvim"})
require('tabout').setup()

vim.pack.add({"https://github.com/cbochs/grapple.nvim"})
-- TODO: add keybindings
require("grapple").setup({
	scope = "git",
	icons = false,
	status = false,
})

vim.pack.add({"https://github.com/pwntester/octo.nvim"})
-- TODO: add keybindings
require("octo").setup({
	default_merge_method = "rebase",
	picker = "fzf-lua"
})

vim.pack.add({"https://github.com/stevearc/quicker.nvim"})
require("quicker").setup()

vim.keymap.set('i', '<c-space>', function()
	vim.lsp.completion.get()
end)

if vim.fn.argc() == 0 then
	require("oil").open()
end

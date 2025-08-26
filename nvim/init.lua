-- require("config.globals")
-- require("config.lazy")

vim.g.mapleader = " "

vim.o.completeopt = "menuone,noinsert,popup,fuzzy" -- modern completion menu

vim.o.foldenable = true   -- enable fold
vim.o.foldlevel = 99      -- start editing with all folds opened
vim.o.foldmethod = "expr" -- use tree-sitter for folding method
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.o.termguicolors = true  -- enable rgb colors

vim.o.number = true         -- enable line number
vim.o.relativenumber = true -- and relative line number

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

vim.opt.diffopt:append("linematch:60")

vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end
})

vim.lsp.enable("lua_ls")

local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function()
    local dir = vim.fn.expand('<afile>:p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- Better LSP UI
vim.diagnostic.config({
  virtual_text = { prefix = '●' },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
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

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = {buffer = event.buf}

    -- Navigation
    vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

    -- Information
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

    -- Code actions
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

    -- Diagnostics
    vim.keymap.set('n', '<leader>nd', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>pd', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
  end,
})

vim.api.nvim_create_user_command('LspInfo', function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    print("No LSP clients attached to current buffer")
  else
    for _, client in ipairs(clients) do
      print("LSP: " .. client.name .. " (ID: " .. client.id .. ")")
    end
  end
end, { desc = 'Show LSP client info' })

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

vim.pack.add({"https://github.com/nvim-focus/focus.nvim",})
require("focus").setup()

vim.pack.add({"https://github.com/miversen33/sunglasses.nvim",})
require("sunglasses").setup({
    filter_type = "NOSYNTAX",
    filter_percent = .4
})

if vim.fn.argc() == 0 then
	require("oil").open()
end

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil file explorer" })

vim.pack.add({"https://github.com/folke/tokyonight.nvim",})
vim.cmd[[colorscheme tokyonight-day]]

vim.keymap.set('i', '<c-space>', function()
  vim.lsp.completion.get()
end)

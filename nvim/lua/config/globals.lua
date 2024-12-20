vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- No thank you
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Sharing is caring
vim.opt.clipboard = "unnamedplus"

-- Me SSD, me like not swap
vim.opt.swapfile = false

-- The only acceptable width
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- My style is going to blind you
vim.opt.background = "light"
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.fillchars = { eob = ' ' }

-- Show me thy numbers!
vim.opt.signcolumn = "yes:1"
vim.opt.number = false
vim.opt.relativenumber = true

-- Make your case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Mouse? I don't use rodents to navigate my code
vim.opt.mouse = ""

-- Arrows? Never heard of em!
-- vim.keymap.set("n", "<up>", "<nop>", { noremap = true })
-- vim.keymap.set("n", "<down>", "<nop>", { noremap = true })
-- vim.keymap.set("n", "<left>", "<nop>", { noremap = true })
-- vim.keymap.set("n", "<right>", "<nop>", { noremap = true })
-- vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
-- vim.keymap.set("i", "<down>", "<nop>", { noremap = true })
-- vim.keymap.set("i", "<left>", "<nop>", { noremap = true })
-- vim.keymap.set("i", "<right>", "<nop>", { noremap = true })
-- vim.keymap.set("c", "<up>", "<nop>", { noremap = true })
-- vim.keymap.set("c", "<down>", "<nop>", { noremap = true })
-- vim.keymap.set("c", "<left>", "<nop>", { noremap = true })
-- vim.keymap.set("c", "<right>", "<nop>", { noremap = true })

-- Pinky promise?
vim.keymap.set("n", "<leader>wc", "<C-W>c")
vim.keymap.set("n", "<leader>wv", "<C-W>v<C-W>l")
vim.keymap.set("n", "<leader>ws", "<C-W>s<C-W>j")

-- You haven't seen anything
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

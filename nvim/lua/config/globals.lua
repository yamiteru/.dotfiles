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

-- Show me thy numbers!
vim.opt.signcolumn = "yes:1"
vim.opt.number = false
vim.opt.relativenumber = false

-- Make your case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Mouse? I don't use rodents to navigate my code
vim.opt.mouse = ""

-- Arrows? Never heard of em!
vim.keymap.set("n", "<up>", "<nop>", { noremap = true })
vim.keymap.set("n", "<down>", "<nop>", { noremap = true })
vim.keymap.set("n", "<left>", "<nop>", { noremap = true })
vim.keymap.set("n", "<right>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<left>", "<nop>", { noremap = true })
vim.keymap.set("i", "<right>", "<nop>", { noremap = true })
vim.keymap.set("c", "<up>", "<nop>", { noremap = true })
vim.keymap.set("c", "<down>", "<nop>", { noremap = true })
vim.keymap.set("c", "<left>", "<nop>", { noremap = true })
vim.keymap.set("c", "<right>", "<nop>", { noremap = true })

-- Pinky promise?
vim.keymap.set("n", "<leader>wc", "<C-W>c")
vim.keymap.set("n", "<leader>wv", "<C-W>v<C-W>l")
vim.keymap.set("n", "<leader>ws", "<C-W>s<C-W>j")

-- You haven't seen anything
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  float = true,
})

local function get_trimmed_path()
	local path = vim.fn.expand('%:p')
	local parts = vim.split(path, '/', {plain = true})
	
	if path == '' then return '' end
	
	if #parts <= 3 then
			return path
	end
	
	local trimmed = table.concat({
			parts[#parts-2],
			parts[#parts-1],
			parts[#parts]
	}, '/')
	
	return '  ' .. trimmed
end

vim.api.nvim_create_autocmd({ 
	"VimEnter", 
	"BufEnter", 
	"BufModifiedSet", 
	"WinEnter", 
	"WinLeave" 
}, {
  callback = function(args)
    local buf = args.buf

    if vim.bo[buf].buftype == "nofile" then
      vim.opt_local.winbar = ""
    else
      vim.opt_local.winbar = get_trimmed_path()
    end
  end
})

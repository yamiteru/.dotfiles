local map = require('yamiteru.map')
local grapple = require('grapple')

local insert = map.insert
local visual = map.visual
local normal = map.normal

insert('jk', '<esc>l')

normal('<leader>wh', '<C-W>h')
normal('<leader>wj', '<C-W>j')
normal('<leader>wk', '<C-W>k')
normal('<leader>wl', '<C-W>l')

normal('<leader>wH', '<C-W>H')
normal('<leader>wJ', '<C-W>J')
normal('<leader>wK', '<C-W>K')
normal('<leader>wL', '<C-W>L')

normal('<leader>wc', '<C-W>c')
normal('<leader>wv', '<C-W>v')
normal('<leader>ws', '<C-W>s')

visual('<leader>y', '"+y')
normal('<leader>Y', '"+yg_')
normal('<leader>y', '"+y')
normal('<leader>yy', '"+yy')

normal('<leader>p', '"+p')
normal('<leader>P', '"+P')
visual('<leader>p', '"+p')
visual('<leader>P', '"+P')

normal('<leader>to', ':NvimTreeFocus<cr>')
normal('<leader>tt', ':NvimTreeToggle<cr>')
normal('<leader>tf', ':NvimTreeFindFile<cr>')

normal('<leader>mf', function()
	grapple.popup_tags()
end)

normal('<leader>ms', function()
	grapple.popup_scopes()
end)

normal('<leader>ma', function()
	grapple.tag()
end)

normal('<leader>md', function()
	grapple.untag()
end)

normal('<leader>mh', function()
	grapple.cycle_backward()
end)

normal('<leader>ml', function()
	grapple.cycle_forward()
end)

normal('<leader>mr', function()
	grapple.reset()
end)

normal('<leader>h', function()
	grapple.select({ key = 1 })
end)

normal('<leader>j', function()
	grapple.select({ key = 2 })
end)

normal('<leader>k', function()
	grapple.select({ key = 3 })
end)

normal('<leader>l', function()
	grapple.select({ key = 4 })
end)

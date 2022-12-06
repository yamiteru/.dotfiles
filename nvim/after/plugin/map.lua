local map = require('yamiteru.map')
local insert = map.insert
local normal = map.normal

insert('jk', '<esc>l')

normal('<leader>ff', '<cmd>Telescope find_files<cr>')
normal('<leader>fg', '<cmd>Telescope live_grep<cr>')
normal('<leader>fb', '<cmd>Telescope buffers<cr>')
normal('<leader>fh', '<cmd>Telescope help_tags<cr>')
normal('<leader>fi', '<cmd>Telescope git_files<cr>')
normal('<leader>ft', '<cmd>Telescope treesitter<cr>')
normal('<leader>fb', '<cmd>Telescope file_browser<cr>')

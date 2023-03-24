local map = require('yamiteru.map')
local normal = map.normal

normal('<leader>ff', '<cmd>Telescope find_files<cr>')
normal('<leader>fg', '<cmd>Telescope live_grep<cr>')
normal('<leader>fb', '<cmd>Telescope buffers<cr>')
normal('<leader>fh', '<cmd>Telescope help_tags<cr>')
normal('<leader>fi', '<cmd>Telescope git_files<cr>')
normal('<leader>ft', '<cmd>Telescope treesitter<cr>')

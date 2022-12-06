local map = require('yamiteru.map')
local normal = map.normal

require("harpoon").setup({
	menu = {
		width = 40,
	},
	global_settings = {
		save_on_toggle = true,
		excluded_filetypes = { "harpoon" },
	}
})

normal("<leader>a", function() require("harpoon.mark").add_file() end)
normal("<leader>s", function() require("harpoon.ui").toggle_quick_menu() end)

normal("<leader>h", function() require("harpoon.ui").nav_file(1) end)
normal("<leader>j", function() require("harpoon.ui").nav_file(2) end)
normal("<leader>k", function() require("harpoon.ui").nav_file(3) end)
normal("<leader>l", function() require("harpoon.ui").nav_file(4) end)

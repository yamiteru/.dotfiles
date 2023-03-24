require('grapple').setup()

require('lualine').setup({
	options = {
		theme = "catppuccin"
	}	
})

require("auto-save").setup() 
require('Comment').setup()
require('leap').add_default_mappings()

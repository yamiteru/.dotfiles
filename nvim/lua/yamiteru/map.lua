local M = {}

function bind(op, outer_opts)
	outer_opts = outer_opts or {noremap = true}
	
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force",
      outer_opts,
      opts or {}
		)
		
		for k,v in ipairs(op) do 
			vim.keymap.set(v, lhs, rhs, opts)
		end	
	end
end

M.visual = bind({'v'})
M.insert = bind({'i'})
M.normal = bind({'n'})
M.map = bind({"n", "v"})

return M

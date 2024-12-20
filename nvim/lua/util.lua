local M = {}

function M.create_cmd(command, f, opts)
  opts = opts or {}
  vim.api.nvim_create_user_command(command, f, opts)
end

return M

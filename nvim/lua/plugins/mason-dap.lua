local opts = {
  ensure_installed = {
    "js",
  },
  automatic_installation = true,
  automatic_setup = true,
}

return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = opts,
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
}

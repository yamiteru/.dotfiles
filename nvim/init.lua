-- TODO: Once Neovim 0.12 stabilizes (expected ~March 2026) and the vim.pack
-- API matures, consider replacing Lazy.nvim with vim.pack + lz.n (or a
-- similar lazy-loading companion). The built-in manager is ~500 LOC, has
-- lockfile support, and is authored by the mini.nvim creator. Currently
-- missing: lazy loading (by design), dependency resolution, after/plugin
-- sourcing, local plugin paths, and user commands. Track progress at:
-- https://github.com/neovim/neovim/issues/34763

-- Leader (set before Lazy so mappings are correct)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable built-in providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Indentation (real tabs, displayed as 4 spaces)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

-- No line numbers
vim.opt.number = false
vim.opt.relativenumber = false

-- No statusline anywhere (global statusline off, then hidden)
vim.opt.laststatus = 0
vim.opt.statusline = " "

-- No visible UI chrome
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.signcolumn = "yes:2"
vim.opt.fillchars = { eob = " ", vert = " ", horiz = " ", horizup = " ", horizdown = " ", vertleft = " ", vertright = " ", verthoriz = " " }
vim.opt.shortmess:append("IcsS")

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Mouse
vim.opt.mouse = ""

-- Wrap
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Scroll
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Splits (open below and right)
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"

-- Persistent undo
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- No swap or backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.pumheight = 10

-- Timings
vim.opt.updatetime = 200
vim.opt.timeoutlen = 300

-- Misc
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.virtualedit = "block"
vim.opt.jumpoptions = "view"
vim.opt.autowriteall = true

-- Folding (managed by nvim-ufo)
vim.opt.foldenable = true
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Diagnostics (no inline text, show on demand)
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  signs = true,
  underline = true,
  severity_sort = true,
  float = { border = "none", source = true },
})

-- Keymaps
local map = vim.keymap.set

-- Split navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower split" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper split" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

-- Split creation
map("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>s", "<cmd>split<cr>", { desc = "Horizontal split" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Better visual indenting (stay in visual mode)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Center screen after jumps
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Paste without overwriting register in visual mode
map("v", "p", '"_dP')

-- Diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>q", "<cmd>Trouble diagnostics toggle<cr>", { desc = "All diagnostics" })
map("n", "<leader>Q", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics" })

-- Close buffer / window
map("n", "<leader>c", "<cmd>bdelete<cr>", { desc = "Close buffer" })
map("n", "<leader>w", "<cmd>close<cr>", { desc = "Close window" })

-- Toggle line numbers
map("n", "<leader>n", function()
  vim.opt.number = not vim.opt.number:get()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle line numbers" })

-- Toggle statusline
map("n", "<leader>l", function()
  if vim.opt.laststatus:get() == 0 then
    vim.opt.laststatus = 3
    vim.opt.statusline = "%f %m %= %l:%c"
  else
    vim.opt.laststatus = 0
    vim.opt.statusline = " "
  end
end, { desc = "Toggle statusline" })

-- Undo tree
map("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Undo tree" })

-- LSP navigation (via fzf-lua for full-screen; supplements built-in K/CTRL-S)
map("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", { desc = "Go to definition" })
map("n", "gD", "<cmd>FzfLua lsp_declarations<cr>", { desc = "Go to declaration" })
map("n", "gy", "<cmd>FzfLua lsp_typedefs<cr>", { desc = "Go to type definition" })
map("n", "grr", "<cmd>FzfLua lsp_references<cr>", { desc = "References" })
map("n", "gri", "<cmd>FzfLua lsp_implementations<cr>", { desc = "Implementations" })
map("n", "gra", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "Code actions" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })

-- Folds (nvim-ufo)
map("n", "zz", "za", { desc = "Toggle fold" })
map("n", "zR", function() require("ufo").openAllFolds() end, { desc = "Open all folds" })
map("n", "zM", function() require("ufo").closeAllFolds() end, { desc = "Close all folds" })

-- Auto-clear command-line messages
local msg_clear_timer = vim.uv.new_timer()
vim.api.nvim_create_autocmd({ "CmdlineLeave", "CursorHold", "CursorHoldI" }, {
  callback = function()
    msg_clear_timer:stop()
    msg_clear_timer:start(2000, 0, vim.schedule_wrap(function()
      vim.cmd.echo()
    end))
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "day" },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight-day")
      local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = bg, fg = bg })
      vim.api.nvim_set_hl(0, "FzfLuaNormal", { bg = bg })
      vim.api.nvim_set_hl(0, "FzfLuaBorder", { bg = bg, fg = bg })
      vim.api.nvim_set_hl(0, "FzfLuaPreviewNormal", { bg = bg })
      vim.api.nvim_set_hl(0, "FzfLuaPreviewBorder", { bg = bg, fg = bg })
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    keys = { { "-", function() require("oil").open(vim.fn.getcwd()) end } },
    opts = {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      view_options = { show_hidden = true },
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-p>"] = false,
      },
    },
    init = function()
      if vim.fn.argc() == 0 then
        vim.fn.timer_start(0, function()
          local has_real_bufs = false
          for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
            if buf.name ~= "" then
              has_real_bufs = true
              break
            end
          end
          if not has_real_bufs then
            require("oil").open(vim.fn.getcwd())
          end
        end)
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })
    end,
  },
  {
    "lewis6991/ts-install.nvim",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      auto_install = true,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = {
      max_lines = 3,
      trim_scope = "outer",
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {
      ui = { border = "none", icons = { package_installed = "o", package_pending = "-", package_uninstalled = "x" } },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        -- LSP
        "typescript-language-server",
        "pyright",
        "rust-analyzer",
        "zls",
        "clojure-lsp",
        "json-lsp",
        "yaml-language-server",
        "css-lsp",
        "html-lsp",
        "lua_ls",
        -- Linting / Spellcheck
        "ruff",
        "typos-lsp",
        "harper-ls",
        -- Formatters
        "biome",
        "yamlfmt",
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>" },
      { "<leader>fh", "<cmd>FzfLua help_tags<cr>" },
      { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>" },
      { "<leader>fS", "<cmd>FzfLua lsp_workspace_symbols<cr>" },
      { "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>" },
      { "<leader>fD", "<cmd>FzfLua diagnostics_workspace<cr>" },
      { "<leader>fr", "<cmd>FzfLua resume<cr>" },
      { "<leader>f/", "<cmd>FzfLua grep_curbuf<cr>" },
    },
    opts = {
      winopts = {
        fullscreen = true,
        border = "none",
        preview = { layout = "horizontal", horizontal = "right:50%", border = "none", number = false },
        hls = {
          normal = "Normal",
          border = "Normal",
          preview_normal = "Normal",
          preview_border = "Normal",
        },
      },
      fzf_colors = {
        ["bg"] = { "bg", "Normal" },
        ["gutter"] = { "bg", "Normal" },
      },
      fzf_opts = { ["--no-separator"] = "" },
      defaults = { file_icons = false, git_icons = false, color_icons = false },
      files = { fd_opts = "--type f --hidden --exclude .git" },
      grep = { rg_opts = "--hidden --glob '!.git' --column --line-number --no-heading --color=always --smart-case" },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      default_format_opts = { lsp_format = "fallback" },
      format_after_save = { lsp_format = "fallback" },
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        css = { "biome" },
        python = { "ruff_format" },
        rust = { "rustfmt" },
        zig = { "zigfmt" },
        yaml = { "yamlfmt" },
      },
    },
  },
  {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      debounce_delay = 2000,
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "s", function() require("flash").jump() end, mode = { "n", "x", "o" } },
      { "S", function() require("flash").treesitter() end, mode = { "n", "x", "o" } },
    },
    opts = {
      labels = "asdfghjklqwertyuiopzxcvbnm",
      modes = { char = { enabled = false } },
    },
  },
  { "echasnovski/mini.ai", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.surround", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.pairs", event = "InsertEnter", opts = {} },
  { "echasnovski/mini.diff", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.bracketed", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.splitjoin", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.move", event = "VeryLazy", opts = {} },
  {
    "echasnovski/mini.hipatterns",
    event = "VeryLazy",
    opts = function()
      local hi = require("mini.hipatterns")
      return {
        highlighters = {
          fix = { pattern = "%f[%w]()FIX()%f[%W]", group = "MiniHipatternsFixme" },
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
          hex_color = hi.gen_highlighter.hex_color(),
        },
      }
    end,
  },
  { "echasnovski/mini.cursorword", event = "VeryLazy", opts = {} },
  { "echasnovski/mini.operators", event = "VeryLazy", opts = {} },
  {
    "TaDaa/vimade",
    event = "VeryLazy",
    config = function()
      local vimade = require("vimade")
      vimade.setup({
        recipe = { "default", { animate = false } },
        ncmode = "windows",
        fadelevel = 0.3,
        tint = { fg = { rgb = { 150, 150, 150 }, intensity = 0.5 } },
        blocklist = {
          oil = { buf_opts = { filetype = "oil" } },
          undotree = { buf_opts = { filetype = "undotree" } },
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      icons = { mappings = false },
      win = { border = "none" },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
      win = { border = "none" },
      icons = { folder_closed = ">", folder_open = "v", indent = { last = "└ ", middle = "├ " } },
    },
  },
  {
    "EvWilson/spelunk.nvim",
    event = "VeryLazy",
    opts = {
      enable_persist = true,
      persist_by_git_branch = true,
      fuzzy_search_provider = "fzf-lua",
      statusline_prefix = "",
      enable_status_col_display = true,
      orientation = {
        bookmark_dimensions = function()
          local half = math.floor(vim.o.columns / 2)
          return {
            base = { width = half - 2, height = vim.o.lines - 2 },
            line = 1,
            col = 1,
          }
        end,
        preview_dimensions = function()
          local half = math.floor(vim.o.columns / 2)
          return {
            base = { width = half - 1, height = vim.o.lines - 2 },
            line = 1,
            col = half + 1,
          }
        end,
        help_dimensions = function()
          return {
            base = { width = vim.o.columns - 2, height = vim.o.lines - 2 },
            line = 1,
            col = 1,
          }
        end,
      },
      window_mappings = {
        close = { "q", "<Esc>" },
      },
      base_mappings = {
        toggle = "<leader>m",
        add = "<leader>ma",
        delete = "<leader>md",
        next_bookmark = "]m",
        prev_bookmark = "[m",
        search_bookmarks = "<leader>mf",
        search_current_bookmarks = "<leader>mc",
        search_stacks = "<leader>ms",
        change_line = "<leader>ml",
      },
    },
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
  {
    "stevearc/resession.nvim",
    lazy = false,
    config = function()
      local resession = require("resession")
      resession.setup({
        autosave = { enabled = true, interval = 60, notify = false },
        extensions = { oil = {} },
      })
      local function get_session_name()
        local cwd = vim.fn.getcwd()
        local branch = vim.trim(vim.fn.system("git branch --show-current"))
        if vim.v.shell_error == 0 then
          return cwd .. branch
        end
        return cwd
      end
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc(-1) == 0 then
            resession.load(get_session_name(), { dir = "dirsession", silence_errors = true })
          end
        end,
        nested = true,
      })
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          resession.save(get_session_name(), { dir = "dirsession", notify = false })
        end,
      })
    end,
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      keymap = { preset = "default" },
      completion = {
        list = { selection = { preselect = false, auto_insert = true } },
        menu = { border = "none", draw = { columns = { { "label", "label_description", gap = 1 }, { "kind" } } } },
        documentation = { auto_show = true, auto_show_delay_ms = 200, window = { border = "none" } },
        ghost_text = { enabled = true },
      },
      signature = { enabled = true, window = { border = "none" } },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
    },
  },
  {
    "dstein64/nvim-scrollview",
    event = "VeryLazy",
    opts = {
      signs_on_startup = { "diagnostics" },
      diagnostics_severities = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
      signs_scrollbar_overlap = "over",
      signs_max_per_row = 1,
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "VeryLazy",
    opts = {
      close_fold_kinds_for_ft = {
        default = { "imports" },
      },
      provider_selector = function(bufnr, _, buftype)
        if buftype ~= "" then
          return ""
        end
        local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
        if ok and parser and vim.treesitter.query.get(parser:lang(), "folds") then
          return { "lsp", "treesitter" }
        end
        return { "lsp", "indent" }
      end,
    },
  },
  {
    "shortcuts/no-neck-pain.nvim",
    lazy = false,
    keys = { { "<leader>z", "<cmd>NoNeckPain<cr>", desc = "Toggle Centered Text" } },
    opts = {
      width = 100,
      autocmds = {
        enableOnVimEnter = true,
      },
      buffers = {
        right = { enabled = true },
        left = { enabled = true },
      },
    },
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    cmd = { "ObsidianToday", "ObsidianSearch", "ObsidianQuickSwitch" },
    keys = {
      { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Open Daily Note" },
      { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "/Users/yamiteru/dev/vault-private",
        },
      },
      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
      },
      disable_frontmatter = true,
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    keys = {
      { "<leader>bb", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>bc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>bo", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>bi", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>bu", function() require("dap").step_out() end, desc = "Step Out" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("mason-nvim-dap").setup({
        ensure_installed = { "python", "js", "codelldb" },
        automatic_installation = true,
      })

      dapui.setup({
        icons = { expanded = "v", collapsed = ">", current_frame = ">" },
        layouts = {
          { elements = { "scopes", "stacks" }, size = 40, position = "left" },
          { elements = { "repl" }, size = 10, position = "bottom" },
        },
      })

      -- Automatically open/close the DAP UI when debugging starts/ends
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        window = { winblend = 0 },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "thenbe/neotest-playwright",
      "jutonz/neotest-bun",
    },
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Run Nearest Test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File Tests" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Test Summary" },
      { "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-bun"),
          require("neotest-playwright").adapter({
            options = {
              persist_project_selection = true,
              enable_dynamic_test_discovery = true,
            },
          }),
        },
        discovery = {
          enabled = false, -- Discovery can be slow on large repos, run on demand
        },
      })
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
      {
        "<localleader>r",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    event = "VeryLazy",
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
    ft = { "markdown", "quarto", "rmd" },
    opts = {
      heading = {
        sign = false,
        icons = { "H1 ", "H2 ", "H3 ", "H4 ", "H5 ", "H6 " },
      },
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "tronikelis/ts-autotag.nvim",
    opts = {},
    event = { "InsertEnter" },
  },
}, {
  defaults = { lazy = true },
  install = { colorscheme = {} },
  ui = {
    border = "none",
    icons = {
      cmd = "",
      config = "",
      event = "",
      favorite = "",
      ft = "",
      init = "",
      import = "",
      keys = "",
      lazy = "",
      loaded = "",
      not_loaded = "",
      plugin = "",
      runtime = "",
      require = "",
      source = "",
      start = "",
      task = "",
      list = { "" },
    },
  },
  checker = { enabled = false },
  change_detection = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Treesitter highlighting (after plugins are loaded)
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- Enable Native Inlay Hints by default
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

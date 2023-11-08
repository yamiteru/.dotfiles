-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/yamiteru/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/yamiteru/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/yamiteru/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/yamiteru/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/yamiteru/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ChatGPT.nvim"] = {
    config = { "\27LJ\2\nˆ\5\0\0\6\0\27\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0005\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0005\2\t\0'\3\n\0'\4\v\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0005\2\f\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0005\2\15\0'\3\16\0'\4\17\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0005\2\18\0'\3\19\0'\4\20\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0005\2\21\0'\3\22\0'\4\23\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0005\2\24\0'\3\25\0'\4\26\0004\5\0\0B\0\5\1K\0\1\0002<CMD>ChatGPTRun code_readability_analyses<CR>\16<leader>cra\1\3\0\0\6n\6v\"<CMD>ChatGPTRun docstring<CR>\16<leader>crd\1\3\0\0\6n\6v&<CMD>ChatGPTRun optimize_code<CR>\16<leader>cro\1\3\0\0\6n\6v!<CMD>ChatGPTRun fix_bugs<CR>\16<leader>crf\1\3\0\0\6n\6v)<CMD>ChatGPTEditWithInstructions<CR>\15<leader>ce\1\3\0\0\6n\6v\26<CMD>ChatGPTActAs<CR>\15<leader>ca\1\3\0\0\6n\6v\21<CMD>ChatGPT<CR>\15<leader>cc\1\3\0\0\6n\6v\bset\vkeymap\bvim\nsetup\fchatgpt\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/ChatGPT.nvim",
    url = "https://github.com/jackMort/ChatGPT.nvim"
  },
  ["Leetbuddy.nvim"] = {
    config = { "\27LJ\2\n“\2\0\0\6\0\14\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\n\0'\4\v\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\f\0'\4\r\0004\5\0\0B\0\5\1K\0\1\0\20<CMD>LBTest<CR>\15<leader>lt\22<CMD>LBSubmit<CR>\15<leader>ls\25<CMD>LBQuestions<CR>\15<leader>lf\6n\bset\vkeymap\bvim\1\0\1\rlanguage\ars\nsetup\14leetbuddy\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/Leetbuddy.nvim",
    url = "https://github.com/Dhanus3133/Leetbuddy.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["auto-save.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14auto-save\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/auto-save.nvim",
    url = "https://github.com/Pocco81/auto-save.nvim"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["copilot.lua"] = {
    commands = { "Copilot" },
    config = { "\27LJ\2\n€\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\15suggestion\1\0\0\vkeymap\1\0\1\vaccept\v<S-CR>\1\0\1\17auto_trigger\2\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n¢\2\0\0\6\0\r\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\v\0'\4\f\0004\5\0\0B\0\5\1K\0\1\0\30<CMD>Gitsigns refresh<CR>\15<leader>gr#<CMD>Gitsigns toggle_signs<CR>\15<leader>gt!<CMD>Gitsigns blame_line<CR>\15<leader>gl\6n\bset\vkeymap\bvim\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["guess-indent.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/nmac427/guess-indent.nvim"
  },
  ["lsp-zero.nvim"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire;\0\2\5\1\3\0\6-\2\0\0009\2\0\0025\4\1\0=\1\2\4B\2\2\1K\0\1\0\0À\vbuffer\1\0\0\20default_keymapsØ\t\1\0\n\0007\0u6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0026\1\0\0'\3\3\0B\1\2\0026\2\0\0'\4\1\0B\2\2\0029\2\4\2B\2\1\0029\3\5\0015\5\n\0004\6\5\0005\a\6\0>\a\1\0065\a\a\0>\a\2\0065\a\b\0>\a\3\0065\a\t\0>\a\4\6=\6\v\0055\6\15\0009\a\f\0019\a\r\a5\t\14\0B\a\2\2=\a\16\0069\a\17\2B\a\1\2=\a\18\0069\a\19\2B\a\1\2=\a\20\6=\6\f\0055\6\24\0009\a\21\0019\a\22\a9\a\23\aB\a\1\2=\a\25\0069\a\21\0019\a\22\a9\a\23\aB\a\1\2=\a\26\6=\6\22\0055\6\28\0003\a\27\0=\a\29\6=\6\30\5B\3\2\0016\3\31\0009\3 \0039\3!\3'\5\"\0'\6#\0006\a\31\0009\a$\a9\a%\a5\b&\0B\3\5\0016\3\31\0009\3 \0039\3!\3'\5\"\0'\6'\0006\a\31\0009\a$\a9\a(\a5\b)\0B\3\5\0016\3\31\0009\3 \0039\3!\3'\5\"\0'\6*\0006\a\31\0009\a$\a9\a+\a5\b,\0B\3\5\0016\3\31\0009\3 \0039\3!\3'\5\"\0'\6-\0006\a\31\0009\a$\a9\a.\a5\b/\0B\3\5\0019\0030\0003\0051\0B\3\2\0016\3\0\0'\0052\0B\3\2\0029\3\5\3B\3\1\0016\3\0\0'\0053\0B\3\2\0029\3\5\0035\0055\0005\0064\0=\0066\5B\3\2\0019\3\5\0004\5\0\0B\3\2\0012\0\0€K\0\1\0\21ensure_installed\1\0\1\27automatic_installation\2\1\21\0\0\vlua_ls\ncssls\thtml\rdockerls\veslint\remmet_ls\fgraphql\vjsonls\rtsserver\rmarksman\rprismals\npylsp\nsqlls\18stylelint_lsp\vsvelte\ntaplo\16tailwindcss\vyamlls\bzls\18rust_analyzer\20mason-lspconfig\nmason\0\14on_attach\1\0\1\tdesc\26Open diagnostics list\15setloclist\14<leader>q\1\0\1\tdesc%Open floating diagnostic message\15open_float\14<leader>e\1\0\1\tdesc\"Go to next diagnostic message\14goto_next\a]d\1\0\1\tdesc&Go to previous diagnostic message\14goto_prev\15diagnostic\a[d\6n\bset\vkeymap\bvim\fsnippet\vexpand\1\0\0\0\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\f<S-Tab>\27luasnip_shift_supertab\n<Tab>\21luasnip_supertab\t<CR>\1\0\0\1\0\1\vselect\2\fconfirm\fmapping\fsources\1\0\0\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\nsetup\15cmp_action\bcmp\vpreset\rlsp-zero\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nk\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\2\18icons_enabled\1\ntheme\vvscode\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.comment"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17mini.comment\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/mini.comment",
    url = "https://github.com/echasnovski/mini.comment"
  },
  ["mini.cursorword"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20mini.cursorword\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/mini.cursorword",
    url = "https://github.com/echasnovski/mini.cursorword"
  },
  ["mini.pairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15mini.pairs\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/mini.pairs",
    url = "https://github.com/echasnovski/mini.pairs"
  },
  ["mkdir.nvim"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/mkdir.nvim",
    url = "https://github.com/jghauser/mkdir.nvim"
  },
  neodim = {
    config = { "\27LJ\2\n\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\thide\1\0\3\17virtual_text\2\14underline\2\nsigns\2\1\0\3\16blend_color\f#000000\nalpha\4\0€€€ÿ\3\18refresh_delay\3Ä\19\nsetup\vneodim\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/opt/neodim",
    url = "https://github.com/zbirenbaum/neodim"
  },
  neotest = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-vitest"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/neotest-vitest",
    url = "https://github.com/marilari88/neotest-vitest"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n\30\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\topen\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\ncloseÌ\1\1\0\4\0\r\0\0236\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0009\2\4\0029\2\5\0023\3\a\0=\3\6\0029\2\3\0009\2\b\0029\2\t\0023\3\n\0=\3\6\0029\2\3\0009\2\b\0029\2\v\0023\3\f\0=\3\6\0022\0\0€K\0\1\0\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\ndapui\bdap\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÑ\1\0\0\6\0\v\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\1K\0\1\0\27<CMD>NvimTreeFocus<CR>\15<leader>nf\28<CMD>NvimTreeToggle<CR>\15<leader>nn\6n\bset\vkeymap\bvim\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÅ\n\0\0\6\0/\0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\14\0005\4\f\0005\5\r\0=\5\n\4=\4\15\0035\4\16\0005\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\4=\4\25\0035\4\26\0005\5\27\0=\5\28\0045\5\29\0=\5\30\4=\4\31\3=\3 \0025\3!\0=\3\"\2B\0\2\0016\0#\0009\0$\0009\0%\0'\2&\0'\3'\0'\4(\0004\5\0\0B\0\5\0016\0#\0009\0$\0009\0%\0'\2&\0'\3)\0'\4*\0004\5\0\0B\0\5\0016\0#\0009\0$\0009\0%\0'\2&\0'\3+\0'\4,\0004\5\0\0B\0\5\0016\0#\0009\0$\0009\0%\0'\2&\0'\3-\0'\4.\0004\5\0\0B\0\5\1K\0\1\0\22<CMD>TSToggle<CR>\15<leader>tt\22<CMD>TSEnable<CR>\15<leader>te\23<CMD>TSDisable<CR>\15<leader>td\22<CMD>TSUpdate<CR>\15<leader>tu\6n\bset\vkeymap\bvim\21ensure_installed\1\24\0\0\blua\bcss\15dockerfile\18gitattributes\14gitcommit\14gitignore\ago\fgraphql\thtml\tjson\rmarkdown\nocaml\vprisma\nregex\trust\vsvelte\bsql\ttoml\btsx\15typescript\15javascript\tyaml\bzig\16textobjects\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\1\0\6\aaf\20@function.outer\aia\21@parameter.inner\aic\17@class.inner\aaa\21@parameter.outer\aac\17@class.outer\aif\20@function.inner\1\0\2\14lookahead\2\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\14<c-space>\22scope_incremental\n<c-s>\21node_incremental\14<c-space>\21node_decremental\14<M-space>\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\23treesitter-context\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["package-info.nvim"] = {
    config = { "\27LJ\2\n÷\3\0\0\6\0\19\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\15\0'\4\16\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\17\0'\4\18\0004\5\0\0B\0\5\1K\0\1\0&<CMD>PackageInfoChangeVersion<CR>\15<leader>pv\29<CMD>PackageInfoHide<CR>\15<leader>ph\29<CMD>PackageInfoShow<CR>\15<leader>ps\31<CMD>PackageInfoDelete<CR>\15<leader>pd\31<CMD>PackageInfoUpdate<CR>\15<leader>pu <CMD>PackageInfoInstall<CR>\15<leader>pi\6n\bset\vkeymap\bvim\nsetup\17package-info\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/package-info.nvim",
    url = "https://github.com/vuki656/package-info.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-repo.nvim"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/telescope-repo.nvim",
    url = "https://github.com/cljoly/telescope-repo.nvim"
  },
  ["telescope-undo.nvim"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/telescope-undo.nvim",
    url = "https://github.com/debugloop/telescope-undo.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n \5\0\0\a\0!\0X6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\v\0005\3\3\0004\4\0\0=\4\4\0035\4\b\0005\5\6\0005\6\5\0=\6\a\5=\5\t\4=\4\n\3=\3\f\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\r\0'\2\4\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\r\0'\2\n\0B\0\2\0016\0\0\0'\2\14\0B\0\2\0026\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\19\0009\5\20\0004\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\21\0009\5\22\0004\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\23\0009\5\24\0004\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\25\0009\5\26\0004\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\27\0009\5\28\0004\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\29\0'\5\30\0004\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\31\0'\5 \0004\6\0\0B\1\5\1K\0\1\0!<CMD>Telescope repo list<CR>\15<leader>fr\28<CMD>Telescope undo<CR>\15<leader>fu\14help_tags\15<leader>fh\fbuffers\15<leader>fb\14live_grep\15<leader>fg\14git_files\15<leader>fv\15find_files\15<leader>ff\6n\bset\vkeymap\bvim\22telescope.builtin\19load_extension\15extensions\1\0\0\trepo\tlist\1\0\0\16search_dirs\1\0\0\1\2\0\0\n~/dev\tundo\1\0\0\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n \2\0\0\6\0\r\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\v\0'\4\f\0004\5\0\0B\0\5\1K\0\1\0\28<CMD>TroubleRefresh<CR>\15<leader>tr*<CMD>Trouble document_diagnostics<CR>\15<leader>td\27<CMD>TroubleToggle<CR>\15<leader>tt\6n\bset\vkeymap\bvim\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vscode.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\1K\0\1\0\tload\nsetup\vvscode\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: auto-save.nvim
time([[Config for auto-save.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14auto-save\frequire\0", "config", "auto-save.nvim")
time([[Config for auto-save.nvim]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nk\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\2\18icons_enabled\1\ntheme\vvscode\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n \5\0\0\a\0!\0X6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\v\0005\3\3\0004\4\0\0=\4\4\0035\4\b\0005\5\6\0005\6\5\0=\6\a\5=\5\t\4=\4\n\3=\3\f\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\r\0'\2\4\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\r\0'\2\n\0B\0\2\0016\0\0\0'\2\14\0B\0\2\0026\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\19\0009\5\20\0004\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\21\0009\5\22\0004\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\23\0009\5\24\0004\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\25\0009\5\26\0004\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\27\0009\5\28\0004\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\29\0'\5\30\0004\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\31\0'\5 \0004\6\0\0B\1\5\1K\0\1\0!<CMD>Telescope repo list<CR>\15<leader>fr\28<CMD>Telescope undo<CR>\15<leader>fu\14help_tags\15<leader>fh\fbuffers\15<leader>fb\14live_grep\15<leader>fg\14git_files\15<leader>fv\15find_files\15<leader>ff\6n\bset\vkeymap\bvim\22telescope.builtin\19load_extension\15extensions\1\0\0\trepo\tlist\1\0\0\16search_dirs\1\0\0\1\2\0\0\n~/dev\tundo\1\0\0\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n\30\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\topen\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\ncloseÌ\1\1\0\4\0\r\0\0236\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0009\2\4\0029\2\5\0023\3\a\0=\3\6\0029\2\3\0009\2\b\0029\2\t\0023\3\n\0=\3\6\0029\2\3\0009\2\b\0029\2\v\0023\3\f\0=\3\6\0022\0\0€K\0\1\0\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\ndapui\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n \2\0\0\6\0\r\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\v\0'\4\f\0004\5\0\0B\0\5\1K\0\1\0\28<CMD>TroubleRefresh<CR>\15<leader>tr*<CMD>Trouble document_diagnostics<CR>\15<leader>td\27<CMD>TroubleToggle<CR>\15<leader>tt\6n\bset\vkeymap\bvim\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: vscode.nvim
time([[Config for vscode.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\1K\0\1\0\tload\nsetup\vvscode\frequire\0", "config", "vscode.nvim")
time([[Config for vscode.nvim]], false)
-- Config for: package-info.nvim
time([[Config for package-info.nvim]], true)
try_loadstring("\27LJ\2\n÷\3\0\0\6\0\19\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\15\0'\4\16\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\17\0'\4\18\0004\5\0\0B\0\5\1K\0\1\0&<CMD>PackageInfoChangeVersion<CR>\15<leader>pv\29<CMD>PackageInfoHide<CR>\15<leader>ph\29<CMD>PackageInfoShow<CR>\15<leader>ps\31<CMD>PackageInfoDelete<CR>\15<leader>pd\31<CMD>PackageInfoUpdate<CR>\15<leader>pu <CMD>PackageInfoInstall<CR>\15<leader>pi\6n\bset\vkeymap\bvim\nsetup\17package-info\frequire\0", "config", "package-info.nvim")
time([[Config for package-info.nvim]], false)
-- Config for: mini.cursorword
time([[Config for mini.cursorword]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20mini.cursorword\frequire\0", "config", "mini.cursorword")
time([[Config for mini.cursorword]], false)
-- Config for: ChatGPT.nvim
time([[Config for ChatGPT.nvim]], true)
try_loadstring("\27LJ\2\nˆ\5\0\0\6\0\27\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0005\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0005\2\t\0'\3\n\0'\4\v\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0005\2\f\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0005\2\15\0'\3\16\0'\4\17\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0005\2\18\0'\3\19\0'\4\20\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0005\2\21\0'\3\22\0'\4\23\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0005\2\24\0'\3\25\0'\4\26\0004\5\0\0B\0\5\1K\0\1\0002<CMD>ChatGPTRun code_readability_analyses<CR>\16<leader>cra\1\3\0\0\6n\6v\"<CMD>ChatGPTRun docstring<CR>\16<leader>crd\1\3\0\0\6n\6v&<CMD>ChatGPTRun optimize_code<CR>\16<leader>cro\1\3\0\0\6n\6v!<CMD>ChatGPTRun fix_bugs<CR>\16<leader>crf\1\3\0\0\6n\6v)<CMD>ChatGPTEditWithInstructions<CR>\15<leader>ce\1\3\0\0\6n\6v\26<CMD>ChatGPTActAs<CR>\15<leader>ca\1\3\0\0\6n\6v\21<CMD>ChatGPT<CR>\15<leader>cc\1\3\0\0\6n\6v\bset\vkeymap\bvim\nsetup\fchatgpt\frequire\0", "config", "ChatGPT.nvim")
time([[Config for ChatGPT.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÑ\1\0\0\6\0\v\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\1K\0\1\0\27<CMD>NvimTreeFocus<CR>\15<leader>nf\28<CMD>NvimTreeToggle<CR>\15<leader>nn\6n\bset\vkeymap\bvim\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: Leetbuddy.nvim
time([[Config for Leetbuddy.nvim]], true)
try_loadstring("\27LJ\2\n“\2\0\0\6\0\14\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\n\0'\4\v\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\f\0'\4\r\0004\5\0\0B\0\5\1K\0\1\0\20<CMD>LBTest<CR>\15<leader>lt\22<CMD>LBSubmit<CR>\15<leader>ls\25<CMD>LBQuestions<CR>\15<leader>lf\6n\bset\vkeymap\bvim\1\0\1\rlanguage\ars\nsetup\14leetbuddy\frequire\0", "config", "Leetbuddy.nvim")
time([[Config for Leetbuddy.nvim]], false)
-- Config for: mini.comment
time([[Config for mini.comment]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17mini.comment\frequire\0", "config", "mini.comment")
time([[Config for mini.comment]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÅ\n\0\0\6\0/\0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\14\0005\4\f\0005\5\r\0=\5\n\4=\4\15\0035\4\16\0005\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\4=\4\25\0035\4\26\0005\5\27\0=\5\28\0045\5\29\0=\5\30\4=\4\31\3=\3 \0025\3!\0=\3\"\2B\0\2\0016\0#\0009\0$\0009\0%\0'\2&\0'\3'\0'\4(\0004\5\0\0B\0\5\0016\0#\0009\0$\0009\0%\0'\2&\0'\3)\0'\4*\0004\5\0\0B\0\5\0016\0#\0009\0$\0009\0%\0'\2&\0'\3+\0'\4,\0004\5\0\0B\0\5\0016\0#\0009\0$\0009\0%\0'\2&\0'\3-\0'\4.\0004\5\0\0B\0\5\1K\0\1\0\22<CMD>TSToggle<CR>\15<leader>tt\22<CMD>TSEnable<CR>\15<leader>te\23<CMD>TSDisable<CR>\15<leader>td\22<CMD>TSUpdate<CR>\15<leader>tu\6n\bset\vkeymap\bvim\21ensure_installed\1\24\0\0\blua\bcss\15dockerfile\18gitattributes\14gitcommit\14gitignore\ago\fgraphql\thtml\tjson\rmarkdown\nocaml\vprisma\nregex\trust\vsvelte\bsql\ttoml\btsx\15typescript\15javascript\tyaml\bzig\16textobjects\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\1\0\6\aaf\20@function.outer\aia\21@parameter.inner\aic\17@class.inner\aaa\21@parameter.outer\aac\17@class.outer\aif\20@function.inner\1\0\2\14lookahead\2\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\14<c-space>\22scope_incremental\n<c-s>\21node_incremental\14<c-space>\21node_decremental\14<M-space>\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n¢\2\0\0\6\0\r\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\v\0'\4\f\0004\5\0\0B\0\5\1K\0\1\0\30<CMD>Gitsigns refresh<CR>\15<leader>gr#<CMD>Gitsigns toggle_signs<CR>\15<leader>gt!<CMD>Gitsigns blame_line<CR>\15<leader>gl\6n\bset\vkeymap\bvim\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: mini.pairs
time([[Config for mini.pairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15mini.pairs\frequire\0", "config", "mini.pairs")
time([[Config for mini.pairs]], false)
-- Config for: lsp-zero.nvim
time([[Config for lsp-zero.nvim]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire;\0\2\5\1\3\0\6-\2\0\0009\2\0\0025\4\1\0=\1\2\4B\2\2\1K\0\1\0\0À\vbuffer\1\0\0\20default_keymapsØ\t\1\0\n\0007\0u6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0026\1\0\0'\3\3\0B\1\2\0026\2\0\0'\4\1\0B\2\2\0029\2\4\2B\2\1\0029\3\5\0015\5\n\0004\6\5\0005\a\6\0>\a\1\0065\a\a\0>\a\2\0065\a\b\0>\a\3\0065\a\t\0>\a\4\6=\6\v\0055\6\15\0009\a\f\0019\a\r\a5\t\14\0B\a\2\2=\a\16\0069\a\17\2B\a\1\2=\a\18\0069\a\19\2B\a\1\2=\a\20\6=\6\f\0055\6\24\0009\a\21\0019\a\22\a9\a\23\aB\a\1\2=\a\25\0069\a\21\0019\a\22\a9\a\23\aB\a\1\2=\a\26\6=\6\22\0055\6\28\0003\a\27\0=\a\29\6=\6\30\5B\3\2\0016\3\31\0009\3 \0039\3!\3'\5\"\0'\6#\0006\a\31\0009\a$\a9\a%\a5\b&\0B\3\5\0016\3\31\0009\3 \0039\3!\3'\5\"\0'\6'\0006\a\31\0009\a$\a9\a(\a5\b)\0B\3\5\0016\3\31\0009\3 \0039\3!\3'\5\"\0'\6*\0006\a\31\0009\a$\a9\a+\a5\b,\0B\3\5\0016\3\31\0009\3 \0039\3!\3'\5\"\0'\6-\0006\a\31\0009\a$\a9\a.\a5\b/\0B\3\5\0019\0030\0003\0051\0B\3\2\0016\3\0\0'\0052\0B\3\2\0029\3\5\3B\3\1\0016\3\0\0'\0053\0B\3\2\0029\3\5\0035\0055\0005\0064\0=\0066\5B\3\2\0019\3\5\0004\5\0\0B\3\2\0012\0\0€K\0\1\0\21ensure_installed\1\0\1\27automatic_installation\2\1\21\0\0\vlua_ls\ncssls\thtml\rdockerls\veslint\remmet_ls\fgraphql\vjsonls\rtsserver\rmarksman\rprismals\npylsp\nsqlls\18stylelint_lsp\vsvelte\ntaplo\16tailwindcss\vyamlls\bzls\18rust_analyzer\20mason-lspconfig\nmason\0\14on_attach\1\0\1\tdesc\26Open diagnostics list\15setloclist\14<leader>q\1\0\1\tdesc%Open floating diagnostic message\15open_float\14<leader>e\1\0\1\tdesc\"Go to next diagnostic message\14goto_next\a]d\1\0\1\tdesc&Go to previous diagnostic message\14goto_prev\15diagnostic\a[d\6n\bset\vkeymap\bvim\fsnippet\vexpand\1\0\0\0\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\f<S-Tab>\27luasnip_shift_supertab\n<Tab>\21luasnip_supertab\t<CR>\1\0\0\1\0\1\vselect\2\fconfirm\fmapping\fsources\1\0\0\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\nsetup\15cmp_action\bcmp\vpreset\rlsp-zero\frequire\0", "config", "lsp-zero.nvim")
time([[Config for lsp-zero.nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0", "config", "guess-indent.nvim")
time([[Config for guess-indent.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Copilot', function(cmdargs)
          require('packer.load')({'copilot.lua'}, { cmd = 'Copilot', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'copilot.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Copilot ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au LspAttach * ++once lua require("packer.load")({'neodim'}, { event = "LspAttach *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

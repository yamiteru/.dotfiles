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
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/opt/coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/opt/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\nj\0\2\6\0\5\0\n6\2\0\0009\2\1\2\18\4\0\0\18\5\1\0B\2\3\0016\2\2\0'\4\3\0B\2\2\0029\2\4\2D\2\1\0\28lsp_ensure_capabilities\bcoq\frequire\23lsp_attach_keybind\bvimí\1\1\1\6\0\15\0\0216\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0029\2\4\0019\2\5\0029\2\6\2+\3\2\0=\3\a\0026\2\b\0'\4\t\0B\2\2\0028\2\0\0029\2\n\0025\4\v\0=\1\f\0043\5\r\0=\5\14\4B\2\2\1K\0\1\0\14on_attach\0\16capabiities\1\0\0\nsetup\14lspconfig\frequire\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvimÌ\5\1\1\b\0 \0u6\1\0\0009\1\1\0019\2\2\0008\1\2\1'\2\4\0=\2\3\0015\1\5\0009\2\2\0=\2\6\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0006\6\0\0009\6\v\0069\6\2\0069\6\f\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\r\0006\6\0\0009\6\v\0069\6\2\0069\6\14\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\15\0006\6\0\0009\6\v\0069\6\2\0069\6\16\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\17\0006\6\0\0009\6\v\0069\6\2\0069\6\18\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\19\0006\6\0\0009\6\v\0069\6\2\0069\6\20\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\21\0006\6\0\0009\6\v\0069\6\2\0069\6\22\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\23\0006\6\0\0009\6\v\0069\6\2\0069\6\24\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\0025\4\25\0'\5\26\0006\6\0\0009\6\v\0069\6\2\0069\6\27\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\28\0006\6\0\0009\6\v\0069\6\2\0069\6\29\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\30\0003\6\31\0\18\a\1\0B\2\5\1K\0\1\0\0\r<space>f\15references\agr\16code_action\r<space>.\1\3\0\0\6n\6v\vrename\14<space>rn\20type_definition\r<space>D\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\blsp\agD\6n\bset\vkeymap\vbuffer\1\0\0\27v:lua.vim.lsp.omnifunc\romnifunc\bbuf\abo\bvim\4\1\0\b\0\28\0H6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0004\2\3\0003\3\5\0>\3\1\2B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0006\4\6\0009\4\v\0049\4\f\4B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0006\4\6\0009\4\v\0049\4\14\4B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\15\0006\4\6\0009\4\v\0049\4\16\4B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\17\0006\4\6\0009\4\v\0049\4\18\4B\0\4\0016\0\6\0009\0\19\0009\0\20\0'\2\21\0005\3\24\0006\4\6\0009\4\19\0049\4\22\4'\6\23\0004\a\0\0B\4\3\2=\4\25\0033\4\26\0=\4\27\3B\0\3\1K\0\1\0\rcallback\0\ngroup\1\0\0\18UserLspConfig\24nvim_create_augroup\14LspAttach\24nvim_create_autocmd\bapi\15setloclist\r<space>q\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\r<space>e\6n\bset\vkeymap\bvim\0\19setup_handlers\20mason-lspconfig\nsetup\nmason\frequire\0" },
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
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n†\n\0\0\6\0/\0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\14\0005\4\f\0005\5\r\0=\5\n\4=\4\15\0035\4\16\0005\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\4=\4\25\0035\4\26\0005\5\27\0=\5\28\0045\5\29\0=\5\30\4=\4\31\3=\3 \0025\3!\0=\3\"\2B\0\2\0016\0#\0009\0$\0009\0%\0'\2&\0'\3'\0'\4(\0004\5\0\0B\0\5\0016\0#\0009\0$\0009\0%\0'\2&\0'\3)\0'\4*\0004\5\0\0B\0\5\0016\0#\0009\0$\0009\0%\0'\2&\0'\3+\0'\4,\0004\5\0\0B\0\5\0016\0#\0009\0$\0009\0%\0'\2&\0'\3-\0'\4.\0004\5\0\0B\0\5\1K\0\1\0\22<CMD>TSToggle<CR>\15<leader>tt\22<CMD>TSEnable<CR>\15<leader>te\23<CMD>TSDisable<CR>\15<leader>td\22<CMD>TSUpdate<CR>\15<leader>tu\6n\bset\vkeymap\bvim\21ensure_installed\1\16\0\0\blua\bcss\14gitignore\thtml\tjson\rmarkdown\nregex\trust\vsvelte\bsql\ttoml\btsx\15typescript\15javascript\tyaml\16textobjects\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[[\17@class.outer\a[m\20@function.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]]\17@class.outer\a]m\20@function.outer\1\0\2\venable\2\14set_jumps\2\vselect\1\0\0\1\0\6\aif\20@function.inner\aac\17@class.outer\aaa\21@parameter.outer\aaf\20@function.outer\aia\21@parameter.inner\aic\17@class.inner\1\0\2\venable\2\14lookahead\2\26incremental_selection\fkeymaps\1\0\4\21node_decremental\14<M-space>\19init_selection\14<c-space>\22scope_incremental\n<c-s>\21node_incremental\14<c-space>\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
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
  ["vscode.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\1K\0\1\0\tload\nsetup\vvscode\frequire\0" },
    loaded = true,
    path = "/Users/yamiteru/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^coq_3p"] = "coq.thirdparty"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\nj\0\2\6\0\5\0\n6\2\0\0009\2\1\2\18\4\0\0\18\5\1\0B\2\3\0016\2\2\0'\4\3\0B\2\2\0029\2\4\2D\2\1\0\28lsp_ensure_capabilities\bcoq\frequire\23lsp_attach_keybind\bvimí\1\1\1\6\0\15\0\0216\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0029\2\4\0019\2\5\0029\2\6\2+\3\2\0=\3\a\0026\2\b\0'\4\t\0B\2\2\0028\2\0\0029\2\n\0025\4\v\0=\1\f\0043\5\r\0=\5\14\4B\2\2\1K\0\1\0\14on_attach\0\16capabiities\1\0\0\nsetup\14lspconfig\frequire\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvimÌ\5\1\1\b\0 \0u6\1\0\0009\1\1\0019\2\2\0008\1\2\1'\2\4\0=\2\3\0015\1\5\0009\2\2\0=\2\6\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0006\6\0\0009\6\v\0069\6\2\0069\6\f\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\r\0006\6\0\0009\6\v\0069\6\2\0069\6\14\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\15\0006\6\0\0009\6\v\0069\6\2\0069\6\16\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\17\0006\6\0\0009\6\v\0069\6\2\0069\6\18\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\19\0006\6\0\0009\6\v\0069\6\2\0069\6\20\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\21\0006\6\0\0009\6\v\0069\6\2\0069\6\22\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\23\0006\6\0\0009\6\v\0069\6\2\0069\6\24\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\0025\4\25\0'\5\26\0006\6\0\0009\6\v\0069\6\2\0069\6\27\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\28\0006\6\0\0009\6\v\0069\6\2\0069\6\29\6\18\a\1\0B\2\5\0016\2\0\0009\2\a\0029\2\b\2'\4\t\0'\5\30\0003\6\31\0\18\a\1\0B\2\5\1K\0\1\0\0\r<space>f\15references\agr\16code_action\r<space>.\1\3\0\0\6n\6v\vrename\14<space>rn\20type_definition\r<space>D\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\blsp\agD\6n\bset\vkeymap\vbuffer\1\0\0\27v:lua.vim.lsp.omnifunc\romnifunc\bbuf\abo\bvim\4\1\0\b\0\28\0H6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0004\2\3\0003\3\5\0>\3\1\2B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0006\4\6\0009\4\v\0049\4\f\4B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0006\4\6\0009\4\v\0049\4\14\4B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\15\0006\4\6\0009\4\v\0049\4\16\4B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\17\0006\4\6\0009\4\v\0049\4\18\4B\0\4\0016\0\6\0009\0\19\0009\0\20\0'\2\21\0005\3\24\0006\4\6\0009\4\19\0049\4\22\4'\6\23\0004\a\0\0B\4\3\2=\4\25\0033\4\26\0=\4\27\3B\0\3\1K\0\1\0\rcallback\0\ngroup\1\0\0\18UserLspConfig\24nvim_create_augroup\14LspAttach\24nvim_create_autocmd\bapi\15setloclist\r<space>q\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\r<space>e\6n\bset\vkeymap\bvim\0\19setup_handlers\20mason-lspconfig\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n†\n\0\0\6\0/\0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\14\0005\4\f\0005\5\r\0=\5\n\4=\4\15\0035\4\16\0005\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\4=\4\25\0035\4\26\0005\5\27\0=\5\28\0045\5\29\0=\5\30\4=\4\31\3=\3 \0025\3!\0=\3\"\2B\0\2\0016\0#\0009\0$\0009\0%\0'\2&\0'\3'\0'\4(\0004\5\0\0B\0\5\0016\0#\0009\0$\0009\0%\0'\2&\0'\3)\0'\4*\0004\5\0\0B\0\5\0016\0#\0009\0$\0009\0%\0'\2&\0'\3+\0'\4,\0004\5\0\0B\0\5\0016\0#\0009\0$\0009\0%\0'\2&\0'\3-\0'\4.\0004\5\0\0B\0\5\1K\0\1\0\22<CMD>TSToggle<CR>\15<leader>tt\22<CMD>TSEnable<CR>\15<leader>te\23<CMD>TSDisable<CR>\15<leader>td\22<CMD>TSUpdate<CR>\15<leader>tu\6n\bset\vkeymap\bvim\21ensure_installed\1\16\0\0\blua\bcss\14gitignore\thtml\tjson\rmarkdown\nregex\trust\vsvelte\bsql\ttoml\btsx\15typescript\15javascript\tyaml\16textobjects\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[[\17@class.outer\a[m\20@function.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]]\17@class.outer\a]m\20@function.outer\1\0\2\venable\2\14set_jumps\2\vselect\1\0\0\1\0\6\aif\20@function.inner\aac\17@class.outer\aaa\21@parameter.outer\aaf\20@function.outer\aia\21@parameter.inner\aic\17@class.inner\1\0\2\venable\2\14lookahead\2\26incremental_selection\fkeymaps\1\0\4\21node_decremental\14<M-space>\19init_selection\14<c-space>\22scope_incremental\n<c-s>\21node_incremental\14<c-space>\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vscode.nvim
time([[Config for vscode.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\1K\0\1\0\tload\nsetup\vvscode\frequire\0", "config", "vscode.nvim")
time([[Config for vscode.nvim]], false)
-- Config for: mini.comment
time([[Config for mini.comment]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17mini.comment\frequire\0", "config", "mini.comment")
time([[Config for mini.comment]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'coq_nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
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

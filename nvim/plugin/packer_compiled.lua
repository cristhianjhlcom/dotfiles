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
local package_path_str = "/home/cristhianjhl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/cristhianjhl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/cristhianjhl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/cristhianjhl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/cristhianjhl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  LuaSnip = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufdelete.nvim"] = {
    config = { "\27LJ\2\nO\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0\17:Bdelete<CR>\14<Leader>q\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\n†\3\0\0\a\0\16\0\0296\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\3€6\2\3\0'\4\4\0B\2\2\0019\2\5\0015\4\6\0005\5\a\0=\5\b\4B\2\2\0016\2\t\0009\2\n\0029\2\v\2)\4\0\0'\5\f\0005\6\r\0B\2\4\0016\2\t\0009\2\n\0029\2\v\2)\4\0\0'\5\14\0005\6\15\0B\2\4\1K\0\1\0\1\0\1\abg\tnone\16NormalFloat\1\0\1\abg\tnone\vNormal\16nvim_set_hl\bapi\bvim\15background\1\0\2\nlight\nlatte\tdark\nmocha\1\0\6\14no_italic\1\fflavour\nmocha\23show_end_of_buffer\1\27transparent_background\2\16term_colors\1\17no_underline\1\nsetup%Error loading catppuccin plugin.\nprint\15catppuccin\frequire\npcall\0" },
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-null-ls.nvim"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/mason-null-ls.nvim",
    url = "https://github.com/jayp0521/mason-null-ls.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  monokai = {
    config = { "\27LJ\2\nð\4\0\0\b\0\31\00036\0\0\0006\2\1\0'\3\2\0B\0\3\0035\2\3\0\14\0\0\0X\3\3€6\3\4\0'\5\5\0B\3\2\0019\3\6\0015\5\a\0=\2\b\0055\6\n\0009\a\t\2=\a\v\6=\6\f\0055\6\14\0009\a\r\2=\a\v\0069\a\15\2=\a\16\6=\6\17\0055\6\19\0009\a\18\2=\a\v\0069\a\15\2=\a\16\6=\6\20\0055\6\22\0009\a\21\2=\a\v\0069\a\15\2=\a\16\6=\6\23\5B\3\2\0016\3\24\0009\3\25\0039\3\26\3)\5\0\0'\6\27\0005\a\28\0B\3\4\0016\3\24\0009\3\25\0039\3\26\3)\5\0\0'\6\29\0005\a\30\0B\3\4\1K\0\1\0\1\0\1\abg\tnone\16NormalFloat\1\0\1\abg\tnone\vNormal\16nvim_set_hl\bapi\bvim\19GitSignsChange\1\0\0\vorange\19GitSignsDelete\1\0\0\tpink\16GitSignsAdd\abg\nbase2\1\0\0\ngreen\14TSInclude\afg\1\0\0\taqua\fpalette\1\0\1\fitalics\1\nsetup\"Error loading monokai plugin.\nprint\1\0\f\vpurple\f#9D65FF\vorange\f#FA8419\vyellow\f#E0D561\ngreen\f#8DD006\nblack\f#272822\taqua\f#66d9ef\tgrey\f#7C7C7C\tpink\f#F4005F\nwhite\f#ffffff\bred\f#F3044B\nbase3\f#2E323C\nbase2\f#202026\fmonokai\frequire\npcall\0" },
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/monokai",
    url = "https://github.com/tanvirtin/monokai.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ripgrep = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/ripgrep",
    url = "https://github.com/BurntSushi/ripgrep"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-heritage"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/vim-heritage",
    url = "https://github.com/jessarcher/vim-heritage"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  ["vim-pasta"] = {
    config = { "\27LJ\2\nG\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rfugitive\29pasta_disabled_filetypes\6g\bvim\0" },
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/vim-pasta",
    url = "https://github.com/sickill/vim-pasta"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/home/cristhianjhl/.local/share/nvim/site/pack/packer/start/vim-visual-star-search",
    url = "https://github.com/nelstrom/vim-visual-star-search"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: bufdelete.nvim
time([[Config for bufdelete.nvim]], true)
try_loadstring("\27LJ\2\nO\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0\17:Bdelete<CR>\14<Leader>q\6n\bset\vkeymap\bvim\0", "config", "bufdelete.nvim")
time([[Config for bufdelete.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n†\3\0\0\a\0\16\0\0296\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\3€6\2\3\0'\4\4\0B\2\2\0019\2\5\0015\4\6\0005\5\a\0=\5\b\4B\2\2\0016\2\t\0009\2\n\0029\2\v\2)\4\0\0'\5\f\0005\6\r\0B\2\4\0016\2\t\0009\2\n\0029\2\v\2)\4\0\0'\5\14\0005\6\15\0B\2\4\1K\0\1\0\1\0\1\abg\tnone\16NormalFloat\1\0\1\abg\tnone\vNormal\16nvim_set_hl\bapi\bvim\15background\1\0\2\nlight\nlatte\tdark\nmocha\1\0\6\14no_italic\1\fflavour\nmocha\23show_end_of_buffer\1\27transparent_background\2\16term_colors\1\17no_underline\1\nsetup%Error loading catppuccin plugin.\nprint\15catppuccin\frequire\npcall\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: monokai
time([[Config for monokai]], true)
try_loadstring("\27LJ\2\nð\4\0\0\b\0\31\00036\0\0\0006\2\1\0'\3\2\0B\0\3\0035\2\3\0\14\0\0\0X\3\3€6\3\4\0'\5\5\0B\3\2\0019\3\6\0015\5\a\0=\2\b\0055\6\n\0009\a\t\2=\a\v\6=\6\f\0055\6\14\0009\a\r\2=\a\v\0069\a\15\2=\a\16\6=\6\17\0055\6\19\0009\a\18\2=\a\v\0069\a\15\2=\a\16\6=\6\20\0055\6\22\0009\a\21\2=\a\v\0069\a\15\2=\a\16\6=\6\23\5B\3\2\0016\3\24\0009\3\25\0039\3\26\3)\5\0\0'\6\27\0005\a\28\0B\3\4\0016\3\24\0009\3\25\0039\3\26\3)\5\0\0'\6\29\0005\a\30\0B\3\4\1K\0\1\0\1\0\1\abg\tnone\16NormalFloat\1\0\1\abg\tnone\vNormal\16nvim_set_hl\bapi\bvim\19GitSignsChange\1\0\0\vorange\19GitSignsDelete\1\0\0\tpink\16GitSignsAdd\abg\nbase2\1\0\0\ngreen\14TSInclude\afg\1\0\0\taqua\fpalette\1\0\1\fitalics\1\nsetup\"Error loading monokai plugin.\nprint\1\0\f\vpurple\f#9D65FF\vorange\f#FA8419\vyellow\f#E0D561\ngreen\f#8DD006\nblack\f#272822\taqua\f#66d9ef\tgrey\f#7C7C7C\tpink\f#F4005F\nwhite\f#ffffff\bred\f#F3044B\nbase3\f#2E323C\nbase2\f#202026\fmonokai\frequire\npcall\0", "config", "monokai")
time([[Config for monokai]], false)
-- Config for: vim-pasta
time([[Config for vim-pasta]], true)
try_loadstring("\27LJ\2\nG\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rfugitive\29pasta_disabled_filetypes\6g\bvim\0", "config", "vim-pasta")
time([[Config for vim-pasta]], false)

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

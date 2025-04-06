-- VIMSCRIPT:

-- Включить мышь
vim.cmd("set mouse")

-----------------------------------------------------------------------------

-- Отключение совместимости с vi. Нужно для правильной работы некоторых опций
vim.cmd("set nocompatible")

-----------------------------------------------------------------------------

-- Игнорирование регистра при поиске
vim.cmd("set ignorecase")

-- Не игнорировать регистр, если в паттерне есть большие буквы
vim.cmd("set smartcase")

-- Подсвечивать найденый паттерн
vim.cmd("set hlsearch")

-- Интерактивный поиск
vim.cmd("set incsearch")

-----------------------------------------------------------------------------

-- Размеры табов - 2
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Прерваратить табы в пробелы
vim.cmd("set expandtab")

-- Умные табы
vim.cmd("set smarttab")

-- Копировать отступ на новой строке
vim.cmd("set autoindent")
vim.cmd("set smartindent")

-----------------------------------------------------------------------------

-- Показать нумерацию строк
vim.cmd("set number")

-- Показать относительную нумерацию строк
vim.cmd("set relativenumber")

-----------------------------------------------------------------------------

-- Использовать системный буфер обмена
vim.cmd("set clipboard=unnamedplus")

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

-- LAZY.NVIM

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------------------------

local opts = {}
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priotity = 1000 }, 
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build= ":TSUpdate"},
  { "vim-airline/vim-airline" },
  { "vim-airline/vim-airline-themes" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
      ---@module "neo-tree"
      ---@type neotree.Config?
    opts = {
      -- fill any relevant options here
    },
  }
}

require("lazy").setup(plugins, opts)

-----------------------------------------------------------------------------

-- Catppuccin
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-----------------------------------------------------------------------------

-- Treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"python", "lua", "javascript"},
  highlight = { enable = true },
  indent = { enable = true }
})

-----------------------------------------------------------------------------

-- VimAirline
vim.g.airline_theme = 'violet'
vim.cmd("AirlineRefresh")

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

--MAPPING 
vim.g.mapleader = " "

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- NERDTree
-- vim.keymap.set('n', '<leader>n', vim.cmd("NERDTreeToggle"))

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------


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

local opts = {}
local plugins = {

  --catpuccin
  { "catppuccin/nvim", name = "catppuccin", priotity = 1000 }, 

  --nvim-telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

--telescope-todo
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  --nvim-treesitter
  { "nvim-treesitter/nvim-treesitter", build= ":TSUpdate" },

  --vim-airline
  { "vim-airline/vim-airline" },
  { "vim-airline/vim-airline-themes" },

  --nvim-tree
  { "nvim-tree/nvim-tree.lua" },

  --dashboard
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {

        --config

      }
    end,
    dependencies = {{'nvim-tree/nvim-web-devicons'}},
  },
}

require("lazy").setup(plugins, opts)

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"python", "lua", "javascript"},
  highlight = { enable = true },
  indent = { enable = true } })

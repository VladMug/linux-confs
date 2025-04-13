
local wk = require("which-key")
wk.add({
  {
    { "<leader>f", group = "File" }, -- group
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Text", mode = "n"},
  },
  {
    { "<leader>t", group = "Tree" },
    { "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Tree"},
    { "<leader>tf", "<cmd>NvimTreeFocus<cr>", desc = "Focus Tree"},
  },

  { "<leader>?", hidden=true },

  { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
--  { "<leader>b", group = "buffers", expand = function()
--      return require("which-key.extras").expand.buf()
--    end
--  },
  {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
     { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
     { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  }
})

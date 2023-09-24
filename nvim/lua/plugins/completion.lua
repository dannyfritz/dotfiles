return {
  { "L3MON4D3/LuaSnip", enabled = false },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert()
    end,
  },
}

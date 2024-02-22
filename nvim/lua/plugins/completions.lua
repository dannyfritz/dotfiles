return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = {
        ["<CR>"] = function(fallback)
          cmp.mapping.abort()
          fallback()
        end,
        ["<Esc>"] = function(fallback)
          cmp.mapping.abort()
          fallback()
        end,
        ["<Tab>"] = function(fallback)
          cmp.mapping.abort()
          fallback()
        end,
        ["<C-h>"] = cmp.mapping.abort(),
        ["<Left>"] = cmp.mapping.abort(),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-l>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        ["<Right>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      }
      return opts
    end,
  },
}

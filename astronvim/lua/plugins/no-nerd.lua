return {
  { "folke/todo-comments.nvim", opts = { signs = false } },
  { "folke/which-key.nvim",
    opts = function(_, opts)
      local get_icon = require("astroui").get_icon
      opts.icons.separator = get_icon("ArrowRight")
      return opts
    end,
  }
}

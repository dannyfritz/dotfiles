return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")
      return vim.tbl_deep_extend("force", opts, {
        defaults = {
          layout_strategy = "vertical",
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-l>"] = actions.preview_scrolling_right,
              ["<C-h>"] = actions.preview_scrolling_left,
            },
            n = {
              ["q"] = actions.close,
            },
          },
        },
      })
    end,
  },
}

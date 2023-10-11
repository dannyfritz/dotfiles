return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections = {
        lualine_a = {
          { "mode", padding = { left = 1, right = 1 } },
        },
        lualine_b = {
          { "progress", separator = " ", padding = { left = 1, right = 1 } },
          { "diff", colored = true },
        },

        lualine_c = {
          { "filename", newfile_status = true, path = 1 },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      }
      opts.extensions = { "lazy" }
      return opts
    end,
  },
}

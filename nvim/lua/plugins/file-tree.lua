return {
  { "nvim-tree/nvim-web-devicons", enabled = false },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    opts = {
      window = {
        position = "right",
      },
    },
  },
  {
    "echasnovski/mini.files",
    opts = {
      options = {
        permanent_delete = false,
        use_as_default_explorer = false,
      },
      windows = {
        max_number = 4,
        preview = true,
        width_preview = 75,
      },
    },
  },
}

return {
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { "kkharji/sqlite.lua", module = "sqlite" },
      { "nvim-telescope/telescope.nvim" },
    },
    opts = {
      enable_persistent_history = true,
    },
    keys = {
      {
        '<Leader>f"',
        function()
          require("telescope").load_extension "neoclip"
          require("telescope").extensions.neoclip["plus"]()
        end,
        desc = "Find yanked value",
      },
      {
        "<Leader>fq",
        function()
          require("telescope").load_extension "neoclip"
          require("telescope").extensions.macroscope.default()
        end,
        desc = "Find macro",
      },
    },
  },
}

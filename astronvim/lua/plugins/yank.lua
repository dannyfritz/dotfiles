return {
  { "kkharji/sqlite.lua", module = "sqlite", lazy = true },
  {
    "AckslD/nvim-neoclip.lua",
    opts = {
      enable_persistent_history = true,
    },
    keys = {
      {
        '<Leader>f"',
        function()
          require("snacks").picker.registers()
        end,
        desc = "Find registers",
      },
    },
  },
}

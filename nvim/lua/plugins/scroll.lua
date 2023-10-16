return {
  {
    {
      "echasnovski/mini.map",
      opts = {
        window = {
          width = 1,
        },
        integrations = {},
      },
      init = function()
        local MiniMap = require("mini.map")
        MiniMap.toggle()
      end,
      keys = {
        {
          "<Leader>uS",
          function()
            local MiniMap = require("mini.map")
            MiniMap.toggle()
          end,
          desc = "Toggle Scrollbar",
        },
      },
    },
  },
}

return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local button = require("astronvim.utils").alpha_button
      local get_icon = require("astronvim.utils").get_icon
      opts.section.buttons.val = {
        button("LDR S .", get_icon("Refresh", 2, true) .. "Last Session  "),
        button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
        button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
        button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
      }
      return opts
    end,
  },
}

return {
  "echasnovski/mini.animate",
  enabled = false,
  opts = function()
    local animate = require("mini.animate")
    return {
      cursor = {
        enable = false,
      },
      resize = {
        enable = false,
        timing = animate.gen_timing.linear({ easint = "out", duration = 8 }),
      },
      open = {
        enable = false,
      },
      close = {
        enable = false,
      },
      scroll = {
        enable = true,
        timing = animate.gen_timing.linear({ easint = "out", duration = 8 }),
        subscroll = animate.gen_subscroll.equal({ max_output_steps = 6 }),
      },
    }
  end,
}

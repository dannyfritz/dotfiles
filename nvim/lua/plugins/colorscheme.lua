return {
  { "rktjmp/lush.nvim", enabled = true },
  -- { "folke/tokyonight.nvim", enabled = true },
  -- { "catppuccin/nvim", name = "catppuccin", enabled = true },
  -- { "p00f/alabaster.nvim" },
  -- { "mcchrish/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" } },
  -- { "ronisbr/nano-theme.nvim" },
  { "dannyfritz/bleak.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "bleak",
    },
    -- init = function()
    --   vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    --     pattern = "neobones",
    --     callback = function(params)
    --       local base = require(params.match)
    --       vim.api.nvim_set_hl(0, "Constant", { fg = base.Constant.fg.hex })
    --       vim.api.nvim_set_hl(0, "Number", { fg = base.Number.fg.hex })
    --     end,
    --   })
    -- end,
  },
  -- { 'echasnovski/mini.colors', version = false },
}

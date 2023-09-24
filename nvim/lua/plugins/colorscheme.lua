return {
  {
    "mcchrish/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    init = function()
      vim.g.neobones_darkness = "stark"
      vim.g.neobones_lighten_cursor_line = 8
      vim.g.neobones_lighten_comments = 50
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "neobones",
    },
  },
}

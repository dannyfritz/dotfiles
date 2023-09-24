return {
  {
    "mcchrish/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    init = function()
      vim.g.neobones_darkness = "stark"
      vim.g.neobones_lighten_cursor_line = 8
      vim.g.neobones_lighten_comments = 40
      vim.g.neobones_italic_comments = false
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "neobones",
    },
  },
}

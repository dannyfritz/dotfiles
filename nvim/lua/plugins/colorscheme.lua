return {
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", name = "catppuccin", enabled = false },
  {
    "mcchrish/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    init = function()
      vim.g.neobones_darkness = "stark"
      vim.g.neobones_lighten_cursor_line = 8
      vim.g.neobones_lighten_comments = 40
      vim.g.neobones_italic_comments = false
      vim.api.nvim_create_autocmd({ "VimEnter", "colorsceme" }, {
        callback = function()
          vim.cmd("highlight ColorColumn guibg=#151820")
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "neobones",
    },
  },
}

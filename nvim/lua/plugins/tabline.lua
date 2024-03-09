return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        tab_size = 5,
        indicator = { icon = nil, style = "none" },
        separator_style = "thick",
      },
    },
  },
  -- {
  --   "b0o/incline.nvim",
  --   opts = {
  --     render = function(props)
  --       local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
  --       local modified = vim.bo[props.buf].modified
  --       if props.focused == false then
  --         return nil
  --       end
  --       return {
  --         " ",
  --         filename,
  --         modified and { " *", guifg = "#888888", gui = "bold" } or "",
  --         " ",
  --         guibg = "#111111",
  --         guifg = "#eeeeee",
  --       }
  --     end,
  --   },
  -- },
}

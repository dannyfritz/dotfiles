return {
  -- { "heirline.nvim", enabled = false },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = false,
        section_separators = "",
        component_separators = " ",
        disabled_filetypes = { statusline = { "alpha", "neo-tree" }, winbar = { "alpha", "grug-far" } },
      },
      extensions = { "lazy", "mason", "man", "neo-tree", "quickfix" },
      sections = {
        lualine_b = { "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "searchcount" },
      },
      -- tabline = {
      --   lualine_a = { { "buffers" } },
      -- },
      winbar = {
        lualine_c = { { "filename", path = 1, file_status = false } },
      },
      inactive_winbar = {
        lualine_b = { { "filename", path = 1, file_status = false } },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        show_buffer_close_icons = false,
        left_trunc_marker = "..",
        right_trunc_marker = "..",
        separator_style = "thin",
      },
    },
    keys = {
      { "<Leader>,", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
      { "<Leader>b", "", desc = "Buffers" },
      {
        "<Leader>by",
        function() vim.cmd [[let @+ = expand('%:p')]] end,
        desc = "Yank Buffer Filename to Clipboard",
      },
      {
        "<Leader>c",
        function()
          local bufs = vim.fn.getbufinfo { buflisted = true }
          require("astrocore.buffer").close(0)
          if require("astrocore").is_available "alpha-nvim" and not bufs[2] then require("alpha").start() end
        end,
        desc = "Close buffer",
      },
      { "H", "<CMD>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
      { "L", "<CMD>BufferLineCycleNext<CR>", desc = "Next buffer" },
    },
  },
}

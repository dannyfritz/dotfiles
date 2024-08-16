return {
  {
    "RRethy/vim-illuminate",
    opts = {
      delay = 0,
      under_cursor = true,
    },
  },
  { "folke/todo-comments.nvim", opts = { signs = false } },
  { "echasnovski/mini.icons", opts = { style = "ascii" } },
  -- { "echasnovski/mini.clue", opts = { window = { delay = 100 } } },
  {
    "kevinhwang91/nvim-hlslens",
    opts = function(_, opts)
      opts.auto_enable = true
      opts.enable_inc_search = true
      opts.calm_down = true
      return opts
    end,
  },
  { "max397574/better-escape.nvim", enabled = false },
  { "mfussenegger/nvim-dap", optional = true, enabled = false },
  { "mfussenegger/nvim-dap-python", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", optional = true, enabled = false },
  { "rcarriga/cmp-dap", optional = true, enabled = false },
  { "akinsho/toggleterm.nvim", optional = true, enabled = false },
  { "vuki656/package-info.nvim", enabled = false },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      local get_icon = require("astroui").get_icon
      -- opts.preset = "modern"
      opts.icons.mappings = false
      opts.icons.separator = ""
      opts.icons.keys = opts.icons.keys or {}
      opts.icons.keys.Space = "‿"
      opts.icons.keys.Up = get_icon("ArrowUp", 1)
      opts.icons.keys.Down = get_icon("ArrowDown", 1)
      opts.icons.keys.Left = get_icon("ArrowLeft", 1)
      opts.icons.keys.Right = get_icon("ArrowRight", 1)
      opts.icons.keys.C = "<C>" .. " "
      opts.icons.keys.M = "<M>" .. " "
      opts.icons.keys.S = "<S>" .. " "
      opts.icons.keys.BS = "<BS>" .. " "
      opts.icons.keys.Esc = "<ESC>" .. " "
      opts.icons.keys.Tab = "<TAB>" .. " "
      opts.icons.keys.CR = "<CR>" .. " "
      return opts
    end,
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local get_icon = require("astroui").get_icon
      opts.section.buttons.val = {
        opts.button("LDR S .", get_icon("Refresh", 2, true) .. "Last Session"),
        opts.button(":ene<CR>", get_icon("DefaultFile", 2, true) .. "New File"),
        opts.button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recent Files"),
        opts.button("LDR f f", get_icon("Search", 2, true) .. "Find File"),
        opts.button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word"),
        opts.button("LDR p a", get_icon("Lazy", 2, true) .. "Update"),
        opts.button("q", get_icon("Quit", 2, true) .. "Quit", ":qa<CR>"),
      }
      return opts
    end,
  },
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
      extensions = { "alpha", "lazy", "mason", "man", "neo-tree", "quickfix" },
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
      { "<Leader>b", desc = "Buffers" },
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
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
        -- { name = "luasnip", priority = 100 },
      }
    end,
  },
}

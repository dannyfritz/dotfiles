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
  { "mfussenegger/nvim-dap-python", enabled = false },
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
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      local get_hlgroup = require("astroui").get_hlgroup
      opts.tabline[2] = status.heirline.make_buflist {
        {
          provider = " ",
          hl = function(self)
            if self.is_visible then
              return { standout = true }
            else
              return {}
            end
          end,
        },
        status.component.tabline_file_info {
          hl = function(self)
            if self.is_visible then
              return { standout = true }
            else
              return {}
            end
          end,
          close_button = false,
        },
      }
      opts.winbar = {
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        fallthrough = false,
        {
          status.component.separated_path {
            path_func = status.provider.filename { modify = ":.:h" },
            separator = "/",
          },
          status.component.file_info {
            file_icon = false,
            file_modified = false,
            filetype = false,
            filename = {},
            file_read_only = false,
            surround = false,
            update = "BufEnter",
          },
        },
      }
      local status_hl = get_hlgroup "StatusLine"
      opts.statusline = {
        status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
        status.component.nav {
          hl = status_hl,
          scrollbar = false,
          ruler = {},
          percentage = {},
          padding = { right = 1 },
        },
        status.component.diagnostics(),
        status.component.cmd_info(),
        -- status.component.file_info({ hl = status_hl, filetype = false, filename = {}, file_modified = false }),
        -- status.component.git_branch(),
        status.component.fill(),
        -- status.component.lsp(),
        -- status.component.treesitter(),
        status.component.mode { surround = { separator = "right" } },
      }
      return opts
    end,
  },
  { -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the sources part of the options table
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
        -- { name = "luasnip", priority = 100 },
      }
    end,
  },
}

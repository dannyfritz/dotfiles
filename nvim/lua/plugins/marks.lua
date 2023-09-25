return {
  -- {
  --   "folke/which-key.nvim",
  --   opts = function(_, opts)
  --     opts.defaults["<leader>m"] = { name = "+bookmarks" }
  --   end,
  -- },
  -- {
  --   "MattesGroeger/vim-bookmarks",
  --   lazy = false,
  --   init = function()
  --     vim.g.bookmark_auto_close = 1
  --     vim.g.bookmark_auto_save = 1
  --     vim.g.bookmark_disable_ctrlp = 0
  --     vim.g.bookmark_display_annotation = 1
  --     vim.g.bookmark_manage_per_buffer = 1
  --     vim.g.bookmark_no_default_key_mappings = 1
  --     vim.g.bookmark_save_per_working_dir = 1
  --     local wk = require("which-key")
  --     wk.register({
  --       m = {
  --         name = "+bookmark",
  --       },
  --     })
  --   end,
  --   keys = {
  --     { "<leader>mm", "<cmd>BookmarkToggle<CR>", desc = "Toggle" },
  --     { "<leader>mj", "<cmd>BookmarkNext<CR>", desc = "Next" },
  --     { "<leader>mk", "<cmd>BookmarkPrevious<CR>", desc = "Previous" },
  --     { "<leader>mn", "<cmd>BookmarkNext<CR>", desc = "Next" },
  --     { "<leader>mp", "<cmd>BookmarkPrevious<CR>", desc = "Previous" },
  --     { "<leader>md", "<cmd>BookmarkClear<CR>", desc = "Clear Buffer" },
  --     { "<leader>mD", "<cmd>BookmarkClearAll<CR>", desc = "Clear All" },
  --     -- Telescope { "<leader>sm", "<cmd>Telescope marks<CR>", desc = "Bookmarks" },
  --   },
  -- },
  {
    "folke/todo-comments.nvim",
    opts = {
      signs = false,
      -- search = {
      --   pattern = [[\b(KEYWORDS)\b]],
      -- },
      merge_keywords = false,
      keywords = {
        -- X = {
        --   icon = "x",
        --   color = "warning",
        --   alt = { "M", "MARK", "HERE" },
        -- },
        TODO = {
          icon = "t",
          color = "hint",
        },
        NOTE = {
          icon = "i",
          color = "info",
          alt = { "INFO" },
        },
        WARN = {
          icon = "w",
          color = "warning",
          alt = { "WARNING", "XXX" },
        },
        HACK = {
          icon = "h",
          color = "warning",
        },
        PERF = {
          icon = "p",
          color = "info",
          alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
        },
      },
      highlight = {
        keyword = "wide_fg",
        after = "",
      },
    },
    keys = function()
      return {
        {
          "gt",
          function()
            require("todo-comments").jump_next()
          end,
          desc = "Next todo comment",
        },
        {
          "gT",
          function()
            require("todo-comments").jump_prev()
          end,
          desc = "Next todo comment",
        },
        {
          "]t",
          function()
            require("todo-comments").jump_next()
          end,
          desc = "Next todo comment",
        },
        {
          "[t",
          function()
            require("todo-comments").jump_prev()
          end,
          desc = "Previous todo comment",
        },
        { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
        { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo comments" },
      }
    end,
  },
}

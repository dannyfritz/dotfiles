return {
  {
    "tomasky/bookmarks.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    -- opts = {
    --   keywords = {
    --     TODO = "☑️ ",
    --     WARN = "⚠️ ",
    --     NOTE = "🛈 ",
    --   },
    -- },
    event = "VimEnter",
    config = function(_, opts)
      require("bookmarks").setup(opts)
      require("telescope").load_extension "bookmarks"
    end,
    keys = {
      { "<Leader>fM", "<cmd>Telescope bookmarks list<cr>", desc = "Find Bookmark" },
      { "<Leader>m", desc = "Bookmarks" },
      {
        "<Leader>mm",
        function()
          local bm = require "bookmarks"
          bm.bookmark_toggle()
        end,
        desc = "Toggle Bookmark",
      },
      -- {
      --   "]m",
      --   function()
      --     local bm = require "bookmarks"
      --     bm.bookmark_next()
      --   end,
      --   desc = "Next Bookmark",
      -- },
      -- {
      --   "[m",
      --   function()
      --     local bm = require "bookmarks"
      --     bm.bookmark_prev()
      --   end,
      --   desc = "Previous Bookmark",
      -- },
      {
        "<Leader>mn",
        function()
          local bm = require "bookmarks"
          bm.bookmark_next()
        end,
        desc = "Next Bookmark",
      },
      {
        "<Leader>mp",
        function()
          local bm = require "bookmarks"
          bm.bookmark_prev()
        end,
        desc = "Previous Bookmark",
      },
      {
        "<Leader>mq",
        function()
          local bm = require "bookmarks"
          bm.bookmark_list()
        end,
        desc = "Bookmark QuickFix",
      },
      {
        "<Leader>md",
        function()
          local bm = require "bookmarks"
          bm.bookmark_clean()
        end,
        desc = "Clear Buffer Bookmarks",
      },
      {
        "<Leader>mD",
        function()
          local bm = require "bookmarks"
          bm.bookmark_clear_all()
        end,
        desc = "Clear All Bookmarks",
      },
    },
  },
}

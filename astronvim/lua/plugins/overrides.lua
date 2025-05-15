function getVisualSelection() return table.concat(vim.fn.getregion(vim.fn.getpos "v", vim.fn.getpos "."), "\n") end
return {
  {
    "RRethy/vim-illuminate",
    opts = {
      delay = 60,
      under_cursor = true,
    },
  },
  { "max397574/better-escape.nvim", optional = true, enabled = false },
  { "akinsho/toggleterm.nvim", optional = true, enabled = false },
  { "vuki656/package-info.nvim", optional = true, enabled = false },
  {
    "Saghen/blink.cmp",
    opts = {
      sources = {
        transform_items = function(_, items)
          return vim.tbl_filter(
            function(item) return item.kind ~= require("blink.cmp.types").CompletionItemKind.Snippet end,
            items
          )
        end,
      },
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<Leader><Space>",
        function()
          require("snacks").picker.files {
            hidden = vim.tbl_get((vim.uv or vim.loop).fs_stat ".git" or {}, "type") == "directory",
          }
        end,
        desc = "Find Files",
      },
      {
        "<Leader>f",
        "",
        desc = "Find",
        mode = { "v" },
      },
      {
        "<Leader>fw",
        function() require("snacks").picker.grep_word { search = getVisualSelection() } end,
        desc = "Find word under cursor",
        mode = { "v" },
      },
      {
        "<Leader>ff",
        function() require("snacks").picker.files { search = getVisualSelection() } end,
        desc = "Find files",
        mode = { "v" },
      },
    },
  },
  {
    "echasnovski/mini.animate",
    opts = function(_, opts)
      local animate = require "mini.animate"
      opts.scroll.timing = animate.gen_timing.cubic { duration = 120, unit = "total", easing = "out" }
      opts.cursor.timing = animate.gen_timing.cubic { duration = 100, unit = "total", easing = "out" }
      return opts
    end,
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = {
      engines = {
        ripgrep = {
          extraArgs = "--no-trim",
        },
      },
    },
  },
  {
    "zeioth/garbage-day.nvim",
    opts = {
      wakeup_delay = 3000,
    },
  },
  {
    "echasnovski/mini.files",
    opts = {
      content = {
        prefix = function() end,
      },
    },
    init = function()
      local MiniFiles = require "mini.files"
      local set_mark = function(id, path, desc) MiniFiles.set_bookmark(id, path, { desc = desc }) end
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesExplorerOpen",
        callback = function() set_mark("r", vim.fn.getcwd, "Working directory") end,
      })
    end,
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>e"] = {
                function()
                  if not require("mini.files").close() then require("mini.files").open(vim.api.nvim_buf_get_name(0)) end
                end,
                desc = "Explorer",
              },
            },
          },
        },
      },
    },
  },
}

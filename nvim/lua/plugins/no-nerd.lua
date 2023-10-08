return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      prompt_prefix = "X",
      selection_caret = ">",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        delete = { text = "▎" },
        topdelete = { text = "▎" },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        format = {
          cmdline = { icon = ">" },
          search_down = { icon = "🔍⌄" },
          search_up = { icon = "🔍⌃" },
          filter = { icon = "$" },
          lua = { icon = "☾" },
          help = { icon = "?" },
        },
      },
      format = {
        level = {
          icons = {
            error = "✖",
            warn = "▼",
            info = "●",
          },
        },
      },
      popupmenu = {
        kind_icons = false,
      },
      inc_rename = {
        cmdline = {
          format = {
            IncRename = { icon = "⟳" },
          },
        },
      },
    },
  },
  {
    "echasnovski/mini.files",
    opts = function(_, opts)
      local my_prefix = function(fs_entry)
        if fs_entry.fs_type == "directory" then
          return "+ ", "MiniFilesDirectory"
        end
        return "  ", "MiniFilesFile"
      end
      opts.content = opts.content or {}
      opts.content.prefix = my_prefix
      return opts
    end,
  },
}

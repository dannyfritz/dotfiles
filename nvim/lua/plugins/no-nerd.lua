local ICONS = {
  ERROR = "✖",
  WARN = "▼",
  INFO = "✹",
  DEBUG = "✹",
  TRACE = "✹",
  SEARCH = "🔍",
}

return {
  {
    "LazyVim/LazyVim",
    opts = {
      icons = {
        misc = {
          dots = ICONS.INFO,
        },
        dap = {
          Stopped = { ICONS.INFO.." ", "DiagnosticWarn", "DapStoppedLine" },
          Breakpoint = ICONS.INFO.." ",
          BreakpointCondition = ICONS.INFO.." ",
          BreakpointRejected = { ICONS.INFO.." ", "DiagnosticError" },
          LogPoint = ".>",
        },
        diagnostics = {
          Error = ICONS.ERROR.." ",
          Warn = ICONS.WARN.." ",
          Hint = ICONS.INFO.." ",
          Info = ICONS.INFO.." ",
        },
        git = {
          added = ICONS.INFO.." ",
          modified = ICONS.INFO.." ",
          removed = ICONS.INFO.." ",
        },
        kinds = {
          Array = ICONS.INFO.." ",
          Boolean = ICONS.INFO.." ",
          Class = ICONS.INFO.." ",
          Codeium = ICONS.INFO.." ",
          Color = ICONS.INFO.." ",
          Control = ICONS.INFO.." ",
          Collapsed = ICONS.INFO.." ",
          Constant = ICONS.INFO.." ",
          Constructor = ICONS.INFO.." ",
          Copilot = ICONS.INFO.." ",
          Enum = ICONS.INFO.." ",
          EnumMember = ICONS.INFO.." ",
          Event = ICONS.INFO.." ",
          Field = ICONS.INFO.." ",
          File = ICONS.INFO.." ",
          Folder = ICONS.INFO.." ",
          Function = ICONS.INFO.." ",
          Interface = ICONS.INFO.." ",
          Key = ICONS.INFO.." ",
          Keyword = ICONS.INFO.." ",
          Method = ICONS.INFO.." ",
          Module = ICONS.INFO.." ",
          Namespace = ICONS.INFO.." ",
          Null = ICONS.INFO.." ",
          Number = ICONS.INFO.." ",
          Object = ICONS.INFO.." ",
          Operator = ICONS.INFO.." ",
          Package = ICONS.INFO.." ",
          Property = ICONS.INFO.." ",
          Reference = ICONS.INFO.." ",
          Snippet = ICONS.INFO.." ",
          String = ICONS.INFO.." ",
          Struct = ICONS.INFO.." ",
          TabNine = ICONS.INFO.." ",
          Text = ICONS.INFO.." ",
          TypeParameter = ICONS.INFO.." ",
          Unit = ICONS.INFO.." ",
          Value = ICONS.INFO.." ",
          Variable = ICONS.INFO.." ",
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        diagnostics_indicator = function(_, _, diag)
          local ret = (diag.error and ICONS.ERROR .. diag.error .. " " or "")
            .. (diag.warning and ICONS.WARN .. diag.warning or "")
          return vim.trim(ret)
        end,
        groups = {
          items = {
            require("bufferline.groups").builtin.pinned:with({ icon = "P" }),
          },
        },
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      icons = {
        ERROR = ICONS.ERROR,
        WARN = ICONS.WARN,
        INFO = ICONS.INFO,
        DEBUG = ICONS.DEBUG,
        TRACE = ICONS.TRACE,
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = ICONS.SEARCH .. " ",
        selection_caret = "> ",
      },
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
          search_down = { icon = ICONS.SEARCH .. "⌄" },
          search_up = { icon = ICONS.SEARCH .. "⌃" },
          filter = { icon = "$" },
          lua = { icon = "🌙" },
          help = { icon = "?" },
        },
      },
      format = {
        level = {
          icons = {
            error = ICONS.ERROR,
            warn = ICONS.WARN,
            info = ICONS.INFO,
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
  {
    "folke/trouble.nvim",
    opts = {
      icons = false,
    },
  },
}

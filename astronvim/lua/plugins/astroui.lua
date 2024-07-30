-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    text_icons = {
      ArrowUp = "↑",
      ArrowDown = "↓",
      ArrowLeft = "←",
      ArrowRight = "→",
      DiagnosticError = "✖",
      DiagnosticWarn = "▼",
      DiagnosticInfo = "✹",
      DiagnosticHint = "✹",
      DefaultFile = " ",
      FolderClosed = "d",
      FolderOpen = "d",
      FolderEmpty = "d",
    },
  },
}

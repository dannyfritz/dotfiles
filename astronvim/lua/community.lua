-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  { "AstroNvim/astrocommunity" },
  -- import/override with your plugins folder
  -- { import = "astrocommunity.colorscheme.mellifluous-nvim" },
  -- { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  -- { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.python-ruff" },
  { "mfussenegger/nvim-dap-python", enabled = false },
  -- { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.scrolling.nvim-scrollbar" },
  { import = "astrocommunity.search.nvim-hlslens" },
  {
    "kevinhwang91/nvim-hlslens",
    opts = function(_, opts)
      opts.auto_enable = true
      opts.enable_inc_search = true
      opts.calm_down = true
      return opts
    end,
  },
}

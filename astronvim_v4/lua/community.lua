-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  -- TODO: Remove branch v4 on release
  { "AstroNvim/astrocommunity", branch = "v4" },
  -- import/override with your plugins folder
  -- { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  -- { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.toml" },
  -- { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.scrolling.nvim-scrollbar" },
  -- { import = "astrocommunity.search.nvim-hlslens" },
}

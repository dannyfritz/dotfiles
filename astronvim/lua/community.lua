-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  { "AstroNvim/astrocommunity" },
  -- import/override with your plugins folder
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.color.nvim-highlight-colors" },
  -- { import = "astrocommunity.colorscheme.lackluster-nvim" },
  { import = "astrocommunity.colorscheme.mellifluous-nvim" },
  -- { import = "astrocommunity.completion.mini-completion" },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  -- { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.file-explorer.mini-files" },
  { import = "astrocommunity.icon.mini-icons" },
  { import = "astrocommunity.indent/indent-blankline-nvim" },
  { import = "astrocommunity.lsp.garbage-day-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  -- { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.quickfix.nvim-bqf" },
  { import = "astrocommunity.scrolling.mini-animate" },
  -- { import = "astrocommunity.scrolling.nvim-scrollbar" },
  { import = "astrocommunity.search.grug-far-nvim" },
  { import = "astrocommunity.search.nvim-hlslens" },
  { import = "astrocommunity.utility.nvim-toggler" },
}

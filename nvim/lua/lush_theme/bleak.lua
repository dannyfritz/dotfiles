--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

local red = hsl(0, 100, 50)
local orange = hsl(40, 100, 50)
local yellow = hsl(60, 100, 50)
local green = hsl(80, 90, 50)
local blue = hsl(200, 100, 50)
local purple = hsl(280, 100, 50)

local bg = hsl(0, 0, 12)
local fg = hsl(240, 3, 86)

local step10 = bg.mix(fg, 10)
local step20 = bg.mix(fg, 20)
local step30 = bg.mix(fg, 30)
local step40 = bg.mix(fg, 40)
local step50 = bg.mix(fg, 50)
local step60 = bg.mix(fg, 60)
local step70 = bg.mix(fg, 70)
local step80 = bg.mix(fg, 80)
local step90 = bg.mix(fg, 90)

local accent1 = fg.mix(blue, 25)
local accent2 = fg.mix(green, 30)
local accent3 = fg.mix(orange, 30)
local fg_subdued = step80;

local error = fg.mix(red, 50)
local warn = fg.mix(orange, 50)
local hint = fg.mix(purple, 50)
local info = fg.mix(blue, 50)
local ok = fg.mix(green, 50)

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    Normal         { fg = fg, bg = bg },

    ColorColumn    { bg = step10 }, -- Columns set with 'colorcolumn'
    Conceal        { fg = fg_subdued }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor         { fg = fg_subdued }, -- Character under the cursor
    CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn   { bg = step10 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine     { bg = step10 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      { fg = accent2 }, -- Directory names (and other special names in listings)
    DiffAdd        { fg = green.desaturate(60) }, -- Diff mode: Added line |diff.txt|
    DiffChange     { fg = orange.desaturate(60) }, -- Diff mode: Changed line |diff.txt|
    DiffDelete     { fg = red.desaturate(60) }, -- Diff mode: Deleted line |diff.txt|
    DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor     { }, -- Cursor in a focused terminal
    TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg       { }, -- Error messages on the command line
    VertSplit      { }, -- Column separating vertically split windows
    Folded         { gui = "underline" }, -- Line used for closed folds
    FoldColumn     { }, -- 'foldcolumn'
    SignColumn     { }, -- Column where |signs| are displayed
    IncSearch      { fg = hint }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute     { fg = ok }, -- |:substitute| replacement text highlighting
    LineNr         { fg = step70 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove    { fg = step50 }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow    { fg = step50 }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen     { fg = accent3.saturate(100), gui = "bold" }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea        { fg = info }, -- Area for messages and cmdline
    MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg        { }, -- |more-prompt|
    NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NormalFloat    { }, -- Normal text in floating windows.
    FloatBorder    { }, -- Border of floating windows.
    FloatTitle     { }, -- Title of floating windows.
    NormalNC       { }, -- normal text in non-current windows
    Pmenu          { }, -- Popup menu: Normal item.
    PmenuSel       { bg = step30 }, -- Popup menu: Selected item.
    PmenuKind      { }, -- Popup menu: Normal item "kind"
    PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    PmenuSbar      { }, -- Popup menu: Scrollbar.
    PmenuThumb     { bg = info }, -- Popup menu: Thumb of the scrollbar.
    Question       { }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     { }, -- Status line of current window
    StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine        { }, -- Tab pages line, not active tab page label
    TabLineFill    { }, -- Tab pages line, where there are no labels
    TabLineSel     { }, -- Tab pages line, active tab page label
    Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         { bg = step30 }, -- Visual mode selection
    VisualNOS      { bg = step30 }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     { fg = warn }, -- Warning messages
    Whitespace     { fg = step50 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator   { fg = step20 }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu       {  }, -- Current match in 'wildmenu' completion
    WinBar         {  }, -- Window bar of current window
    WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = step50 }, -- Any comment
    Constant       { }, -- (*) Any constant
    String         { }, --   A string constant: "this is a string"
    Character      { }, --   A character constant: 'c', '\n'
    Number         { }, --   A number constant: 234, 0xff
    Boolean        { }, --   A boolean constant: TRUE, false
    Float          { }, --   A floating point constant: 2.3e10
    Identifier     { }, -- (*) Any variable name
    Function       { }, --   Function name (also: methods for classes)
    Statement      { }, -- (*) Any statement
    Conditional    { fg = accent3 }, --   if, then, else, endif, switch, etc.
    Repeat         { fg = accent3 }, --   for, do, while, etc.
    Label          { fg = accent3 }, --   case, default, etc.
    Operator       { fg = accent3 }, --   "sizeof", "+", "*", etc.
    Keyword        { fg = accent3 }, --   any other keyword
    Exception      { fg = accent3 }, --   try, catch, throw
    PreProc        { fg = accent3 }, -- (*) Generic Preprocessor
    Include        { fg = accent3 }, --   Preprocessor #include
    Define         { fg = accent3 }, --   Preprocessor #define
    Macro          { fg = accent3 }, --   Same as Define
    PreCondit      { fg = accent3 }, --   Preprocessor #if, #else, #endif, etc.
    Type           { fg = accent1 }, -- (*) int, long, char, etc.
    StorageClass   { fg = accent3 }, --   static, register, volatile, etc.
    Structure      { fg = accent3 }, --   struct, union, enum, etc.
    Typedef        { }, --   A typedef
    Special        { }, -- (*) Any special symbol
    SpecialChar    { }, --   Special character in a constant
    Tag            { }, --   You can use CTRL-] on this
    Delimiter      { fg = accent3 }, --   Character that needs attention
    SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    Debug          { }, --   Debugging statements
    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { fg = error }, -- Any erroneous construct
    Todo           { fg = info }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    LspReferenceText            { }, -- Used for highlighting "text" references
    LspReferenceRead            { }, -- Used for highlighting "read" references
    LspReferenceWrite           { }, -- Used for highlighting "write" references
    LspCodeLens                 { }, -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    LspCodeLensSeparator        { }, -- Used to color the seperator between two or more code lens.
    LspSignatureActiveParameter { }, -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!

    DiagnosticError            { fg = error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = warn }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk               { fg = ok }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError { DiagnosticError }, -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn  { DiagnosticWarn }, -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo  { DiagnosticInfo }, -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint  { DiagnosticHint }, -- Used for "Hint" diagnostic virtual text.
    DiagnosticVirtualTextOk    { DiagnosticOk }, -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError   { DiagnosticError }, -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { DiagnosticWarn }, -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { DiagnosticInfo }, -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { DiagnosticHint }, -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk      { DiagnosticOk }, -- Used to underline "Ok" diagnostics.
    DiagnosticFloatingError    { DiagnosticError }, -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    DiagnosticFloatingWarn     { DiagnosticWarn }, -- Used to color "Warn" diagnostic messages in diagnostics float.
    DiagnosticFloatingInfo     { DiagnosticInfo }, -- Used to color "Info" diagnostic messages in diagnostics float.
    DiagnosticFloatingHint     { DiagnosticHint }, -- Used to color "Hint" diagnostic messages in diagnostics float.
    DiagnosticFloatingOk       { DiagnosticOk }, -- Used to color "Ok" diagnostic messages in diagnostics float.
    DiagnosticSignError        { DiagnosticError }, -- Used for "Error" signs in sign column.
    DiagnosticSignWarn         { DiagnosticWarn }, -- Used for "Warn" signs in sign column.
    DiagnosticSignInfo         { DiagnosticInfo }, -- Used for "Info" signs in sign column.
    DiagnosticSignHint         { DiagnosticHint }, -- Used for "Hint" signs in sign column.
    DiagnosticSignOk           { DiagnosticOk }, -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    sym"@text.literal"      { Comment }, -- Comment
    sym"@text.reference"    { Identifier }, -- Identifier
    sym"@text.title"        { Title }, -- Title
    sym"@text.uri"          { Underlined }, -- Underlined
    sym"@text.underline"    { Underlined }, -- Underlined
    sym"@text.todo"         { Todo }, -- Todo
    sym"@comment"           { Comment }, -- Comment
    sym"@punctuation"       { Delimiter }, -- Delimiter
    sym"@constant"          { Constant }, -- Constant
    sym"@constant.builtin"  { Special }, -- Special
    sym"@constant.macro"    { Define }, -- Define
    sym"@define"            { Define }, -- Define
    sym"@macro"             { Macro }, -- Macro
    sym"@string"            { String }, -- String
    sym"@string.escape"     { SpecialChar }, -- SpecialChar
    sym"@string.special"    { SpecialChar }, -- SpecialChar
    sym"@character"         { Character }, -- Character
    sym"@character.special" { SpecialChar }, -- SpecialChar
    sym"@number"            { Number }, -- Number
    sym"@boolean"           { Boolean }, -- Boolean
    sym"@float"             { Float }, -- Float
    sym"@function"          { Function }, -- Function
    sym"@function.builtin"  { Special }, -- Special
    sym"@function.macro"    { Macro }, -- Macro
    sym"@parameter"         { Identifier }, -- Identifier
    sym"@method"            { Function }, -- Function
    sym"@field"             { Identifier }, -- Identifier
    sym"@property"          { Identifier }, -- Identifier
    sym"@constructor"       { Special }, -- Special
    sym"@conditional"       { Conditional }, -- Conditional
    sym"@repeat"            { Repeat }, -- Repeat
    sym"@label"             { Label }, -- Label
    sym"@operator"          { Operator }, -- Operator
    sym"@keyword"           { Keyword }, -- Keyword
    sym"@exception"         { Exception }, -- Exception
    sym"@variable"          { Identifier }, -- Identifier
    sym"@type"              { Type }, -- Type
    sym"@type.definition"   { Typedef }, -- Typedef
    sym"@storageclass"      { StorageClass }, -- StorageClass
    sym"@structure"         { Structure }, -- Structure
    sym"@namespace"         { Identifier }, -- Identifier
    sym"@include"           { Include }, -- Include
    sym"@preproc"           { PreProc }, -- PreProc
    sym"@debug"             { Debug }, -- Debug
    sym"@tag"               { Tag }, -- Tag

    -- GitSigns
    -- https://github.com/lewis6991/gitsigns.nvim
    -- GitSignsAdd             { DiffAdd },
    -- GitSignsChange          { DiffChange },
    -- GitSignsDelete          { DiffDelete },

}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap

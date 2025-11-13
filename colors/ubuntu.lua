-- Ubuntu Professional colorscheme for Neovim
-- Based on Ubuntu's Professional terminal theme

vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end

vim.o.termguicolors = true
vim.g.colors_name = 'ubuntu'

-- Ubuntu Professional color palette
local colors = {
  bg        = '#300a24',
  fg        = '#ffffff',
  black     = '#2e3436',
  gray      = '#555753',
  red       = '#cc0000',
  bred      = '#ef2929',
  green     = '#4e9a06',
  bgreen    = '#8ae234',
  yellow    = '#c4a000',
  byellow   = '#fce94f',
  blue      = '#3465a4',
  bblue     = '#729fcf',
  magenta   = '#75507b',
  bmagenta  = '#ad7fa8',
  cyan      = '#06989a',
  bcyan     = '#34e2e2',
  white     = '#d3d7cf',
  bwhite    = '#eeeeec',
  selection = '#4a1930',
  cursorline = '#3d0f2a',
  statusline = '#4a1930',
  statusline_nc = '#2a0818',
}

local highlights = {
  -- Editor colors
  Normal = { fg = colors.fg, bg = colors.bg },
  Cursor = { fg = colors.bg, bg = colors.fg },
  CursorLine = { bg = colors.cursorline },
  CursorColumn = { bg = colors.cursorline },
  LineNr = { fg = colors.gray },
  CursorLineNr = { fg = colors.byellow, bold = true },
  Visual = { bg = colors.selection },
  VisualNOS = { bg = colors.selection },
  Search = { fg = colors.bg, bg = colors.byellow },
  IncSearch = { fg = colors.bg, bg = colors.bred },
  ColorColumn = { bg = colors.cursorline },
  SignColumn = { bg = colors.bg },
  Folded = { fg = colors.gray, bg = colors.bg },
  FoldColumn = { fg = colors.gray, bg = colors.bg },

  -- UI elements
  StatusLine = { fg = colors.fg, bg = colors.statusline },
  StatusLineNC = { fg = colors.gray, bg = colors.statusline_nc },
  VertSplit = { fg = colors.magenta, bg = colors.bg },
  TabLine = { fg = colors.fg, bg = colors.statusline },
  TabLineFill = { bg = colors.bg },
  TabLineSel = { fg = colors.bg, bg = colors.fg, bold = true },
  Pmenu = { fg = colors.fg, bg = colors.statusline },
  PmenuSel = { fg = colors.bg, bg = colors.bmagenta, bold = true },
  PmenuSbar = { bg = colors.gray },
  PmenuThumb = { bg = colors.white },
  WildMenu = { fg = colors.bg, bg = colors.byellow },

  -- Syntax highlighting
  Comment = { fg = colors.gray, italic = true },
  Constant = { fg = colors.bred },
  String = { fg = colors.bgreen },
  Character = { fg = colors.bgreen },
  Number = { fg = colors.bred },
  Boolean = { fg = colors.bred },
  Float = { fg = colors.bred },
  Identifier = { fg = colors.bblue },
  Function = { fg = colors.bcyan, bold = true },
  Statement = { fg = colors.bmagenta, bold = true },
  Conditional = { fg = colors.bmagenta, bold = true },
  Repeat = { fg = colors.bmagenta, bold = true },
  Label = { fg = colors.bmagenta },
  Operator = { fg = colors.fg },
  Keyword = { fg = colors.bmagenta, bold = true },
  Exception = { fg = colors.bred, bold = true },
  PreProc = { fg = colors.byellow },
  Include = { fg = colors.bmagenta },
  Define = { fg = colors.bmagenta },
  Macro = { fg = colors.byellow },
  PreCondit = { fg = colors.byellow },
  Type = { fg = colors.byellow, bold = true },
  StorageClass = { fg = colors.bmagenta },
  Structure = { fg = colors.byellow },
  Typedef = { fg = colors.byellow },
  Special = { fg = colors.bcyan },
  SpecialChar = { fg = colors.bcyan },
  Tag = { fg = colors.bcyan },
  Delimiter = { fg = colors.fg },
  SpecialComment = { fg = colors.bcyan, italic = true },
  Debug = { fg = colors.bred },
  Underlined = { fg = colors.bblue, underline = true },
  Error = { fg = colors.bred, bg = colors.bg, bold = true },
  Todo = { fg = colors.byellow, bg = colors.bg, bold = true },

  -- Diff
  DiffAdd = { fg = colors.bgreen, bg = '#1a3a1a' },
  DiffChange = { fg = colors.byellow, bg = '#3a3a1a' },
  DiffDelete = { fg = colors.bred, bg = '#3a1a1a' },
  DiffText = { fg = colors.byellow, bg = '#3a3a1a', bold = true },

  -- Git signs
  GitSignsAdd = { fg = colors.bgreen },
  GitSignsChange = { fg = colors.byellow },
  GitSignsDelete = { fg = colors.bred },

  -- Treesitter
  ['@variable'] = { link = 'Identifier' },
  ['@variable.builtin'] = { link = 'Special' },
  ['@variable.parameter'] = { link = 'Identifier' },
  ['@constant'] = { link = 'Constant' },
  ['@constant.builtin'] = { link = 'Special' },
  ['@string'] = { link = 'String' },
  ['@string.escape'] = { link = 'SpecialChar' },
  ['@character'] = { link = 'Character' },
  ['@number'] = { link = 'Number' },
  ['@boolean'] = { link = 'Boolean' },
  ['@float'] = { link = 'Float' },
  ['@function'] = { link = 'Function' },
  ['@function.builtin'] = { link = 'Special' },
  ['@function.macro'] = { link = 'Macro' },
  ['@parameter'] = { link = 'Identifier' },
  ['@method'] = { link = 'Function' },
  ['@field'] = { link = 'Identifier' },
  ['@property'] = { link = 'Identifier' },
  ['@constructor'] = { link = 'Function' },
  ['@keyword'] = { link = 'Keyword' },
  ['@keyword.function'] = { link = 'Keyword' },
  ['@keyword.operator'] = { link = 'Operator' },
  ['@conditional'] = { link = 'Conditional' },
  ['@repeat'] = { link = 'Repeat' },
  ['@label'] = { link = 'Label' },
  ['@operator'] = { link = 'Operator' },
  ['@exception'] = { link = 'Exception' },
  ['@type'] = { link = 'Type' },
  ['@type.builtin'] = { link = 'Type' },
  ['@type.qualifier'] = { link = 'Keyword' },
  ['@structure'] = { link = 'Structure' },
  ['@include'] = { link = 'Include' },
  ['@comment'] = { link = 'Comment' },
  ['@tag'] = { link = 'Tag' },
  ['@tag.attribute'] = { link = 'Identifier' },
  ['@tag.delimiter'] = { link = 'Delimiter' },

  -- LSP
  DiagnosticError = { fg = colors.bred },
  DiagnosticWarn = { fg = colors.byellow },
  DiagnosticInfo = { fg = colors.bblue },
  DiagnosticHint = { fg = colors.bcyan },
  LspReferenceText = { bg = colors.cursorline },
  LspReferenceRead = { bg = colors.cursorline },
  LspReferenceWrite = { bg = colors.cursorline },

  -- Telescope
  TelescopeBorder = { fg = colors.magenta },
  TelescopePromptBorder = { fg = colors.bmagenta },
  TelescopeResultsBorder = { fg = colors.magenta },
  TelescopePreviewBorder = { fg = colors.magenta },
  TelescopeSelection = { bg = colors.selection, bold = true },
  TelescopeMatching = { fg = colors.byellow, bold = true },

  -- Blink completion
  BlinkCmpMenu = { link = 'Pmenu' },
  BlinkCmpMenuBorder = { link = 'TelescopeBorder' },
  BlinkCmpMenuSelection = { link = 'PmenuSel' },
  BlinkCmpLabel = { link = 'Normal' },
  BlinkCmpLabelMatch = { link = 'TelescopeMatching' },
  BlinkCmpKind = { link = 'Special' },
  BlinkCmpSource = { link = 'Comment' },
}

for group, settings in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, settings)
end

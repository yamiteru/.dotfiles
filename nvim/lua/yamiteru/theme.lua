local colors = {
	base00 = '#E9E9E9', -- background
	base01 = '#DCDCDC', -- line background
	base02 = '#DCDCDC', -- border/selection
	base03 = '#A3A3A3', -- comments
	base04 = '#000000', -- line number
	base05 = '#000000', -- constants
	base06 = '#FF0000',
	base07 = '#00FF00',
	base08 = '#A3A3A3', -- functions
	base09 = '#000000', -- literals
	base0A = '#A3A3A3', -- types/for
	base0B = '#000000', -- strings
	base0C = '#A3A3A3', -- return/new line
	base0D = '#A3A3A3', -- const/var
	base0E = '#A3A3A3', -- fun/try
	base0F = '#A3A3A3', -- brackets
}

function hi(group, args)
	local command
  if args.link ~= nil then
    command = string.format('highlight! link %s %s', group, args.link)
  else
    command = string.format(
      'highlight %s guifg=%s ctermfg=%s guibg=%s ctermbg=%s gui=%s cterm=%s guisp=%s blend=%s',
      group,
      args.fg and args.fg.gui or 'NONE',
      args.fg and args.fg.cterm or 'NONE',
      args.bg and args.bg.gui or 'NONE',
      args.bg and args.bg.cterm or 'NONE',
      args.attr or 'NONE',
      args.attr or 'NONE',
      args.sp and args.sp.gui or 'NONE',
      args.blend or 'NONE'
    )
  end
  vim.cmd(command)
end

if vim.g.colors_name then vim.cmd('highlight clear') end
vim.g.colors_name = nil

hi('ColorColumn',    {fg=nil,      bg=colors.base01, attr=nil,            sp=nil})
hi('Conceal',        {fg=colors.base0D, bg=nil,      attr=nil,            sp=nil})
hi('CurSearch',      {fg=colors.base01, bg=colors.base09, attr=nil,            sp=nil})
hi('Cursor',         {fg=colors.base00, bg=colors.base05, attr=nil,            sp=nil})
hi('CursorColumn',   {fg=nil,      bg=colors.base01, attr=nil,            sp=nil})
hi('CursorIM',       {fg=colors.base00, bg=colors.base05, attr=nil,            sp=nil})
hi('CursorLine',     {fg=nil,      bg=colors.base01, attr=nil,            sp=nil})
hi('CursorLineFold', {fg=colors.base0C, bg=colors.base01, attr=nil,            sp=nil})
hi('CursorLineNr',   {fg=colors.base04, bg=colors.base01, attr=nil,            sp=nil})
hi('CursorLineSign', {fg=colors.base03, bg=colors.base01, attr=nil,            sp=nil})
hi('Directory',      {fg=colors.base0D, bg=nil,      attr=nil,            sp=nil})
hi('EndOfBuffer',    {fg=colors.base03, bg=nil,      attr=nil,            sp=nil})
hi('ErrorMsg',       {fg=colors.base08, bg=colors.base00, attr=nil,            sp=nil})
hi('FoldColumn',     {fg=colors.base0C, bg=colors.base01, attr=nil,            sp=nil})
hi('Folded',         {fg=colors.base03, bg=colors.base01, attr=nil,            sp=nil})
hi('IncSearch',      {fg=colors.base01, bg=colors.base09, attr=nil,            sp=nil})
hi('lCursor',        {fg=colors.base00, bg=colors.base05, attr=nil,            sp=nil})
hi('LineNr',         {fg=colors.base03, bg=colors.base01, attr=nil,            sp=nil})
hi('LineNrAbove',    {fg=colors.base03, bg=colors.base01, attr=nil,            sp=nil})
hi('LineNrBelow',    {fg=colors.base03, bg=colors.base01, attr=nil,            sp=nil})
hi('MatchParen',     {fg=nil,      bg=colors.base02, attr=nil,            sp=nil})
hi('ModeMsg',        {fg=colors.base0B, bg=nil,      attr=nil,            sp=nil})
hi('MoreMsg',        {fg=colors.base0B, bg=nil,      attr=nil,            sp=nil})
hi('MsgArea',        {fg=colors.base05, bg=colors.base00, attr=nil,            sp=nil})
hi('MsgSeparator',   {fg=colors.base04, bg=colors.base02, attr=nil,            sp=nil})
hi('NonText',        {fg=colors.base03, bg=nil,      attr=nil,            sp=nil})
hi('Normal',         {fg=colors.base05, bg=colors.base00, attr=nil,            sp=nil})
hi('NormalFloat',    {fg=colors.base05, bg=colors.base01, attr=nil,            sp=nil})
hi('NormalNC',       {fg=colors.base05, bg=colors.base00, attr=nil,            sp=nil})

-- Pmenu
hi('Pmenu',          {fg=colors.base05, bg=colors.base01, attr=nil,            sp=nil})
hi('PmenuExtra',     {fg=colors.base05, bg=colors.base01, attr=nil,            sp=nil})
hi('PmenuExtraSel',  {fg=colors.base05, bg=colors.base01, attr='reverse',      sp=nil})
hi('PmenuKind',      {fg=colors.base05, bg=colors.base01, attr=nil,            sp=nil})
hi('PmenuKindSel',   {fg=colors.base05, bg=colors.base01, attr='reverse',      sp=nil})
hi('PmenuMatch',     {fg=colors.base05, bg=colors.base01, attr='bold',         sp=nil})
hi('PmenuMatchSel',  {fg=colors.base05, bg=colors.base01, attr='bold,reverse', sp=nil})
hi('PmenuSbar',      {fg=nil,      bg=colors.base02, attr=nil,            sp=nil})
hi('PmenuSel',       {fg=colors.base05, bg=colors.base01, attr='reverse',      sp=nil})
hi('PmenuThumb',     {fg=nil,      bg=colors.base07, attr=nil,            sp=nil})

hi('Question',       {fg=colors.base0D, bg=nil,      attr=nil,            sp=nil})
hi('QuickFixLine',   {fg=nil,      bg=colors.base01, attr=nil,            sp=nil})
hi('Search',         {fg=colors.base01, bg=colors.base0A, attr=nil,            sp=nil})
hi('SignColumn',     {fg=colors.base03, bg=colors.base01, attr=nil,            sp=nil})
hi('SpecialKey',     {fg=colors.base03, bg=nil,      attr=nil,            sp=nil})

-- spell
hi('SpellBad',       {fg=nil,      bg=nil,      attr='undercurl',    sp=colors.base08})
hi('SpellCap',       {fg=nil,      bg=nil,      attr='undercurl',    sp=colors.base0D})
hi('SpellLocal',     {fg=nil,      bg=nil,      attr='undercurl',    sp=colors.base0C})
hi('SpellRare',      {fg=nil,      bg=nil,      attr='undercurl',    sp=colors.base0E})

hi('StatusLine',     {fg=colors.base04, bg=colors.base02, attr=nil,            sp=nil})
hi('StatusLineNC',   {fg=colors.base03, bg=colors.base01, attr=nil,            sp=nil})
hi('Substitute',     {fg=colors.base01, bg=colors.base0A, attr=nil,            sp=nil})
hi('TermCursor',     {fg=nil,      bg=nil,      attr='reverse',      sp=nil})
hi('TermCursorNC',   {fg=nil,      bg=nil,      attr='reverse',      sp=nil})
hi('Title',          {fg=colors.base0D, bg=nil,      attr=nil,            sp=nil})
hi('VertSplit',      {fg=colors.base02, bg=colors.base02, attr=nil,            sp=nil})
hi('Visual',         {fg=nil,      bg=colors.base02, attr=nil,            sp=nil})
hi('VisualNOS',      {fg=colors.base08, bg=nil,      attr=nil,            sp=nil})
hi('WarningMsg',     {fg=colors.base08, bg=nil,      attr=nil,            sp=nil})
hi('Whitespace',     {fg=colors.base03, bg=nil,      attr=nil,            sp=nil})
hi('WildMenu',       {fg=colors.base08, bg=colors.base0A, attr=nil,            sp=nil})
hi('WinBar',         {fg=colors.base04, bg=colors.base02, attr=nil,            sp=nil})
hi('WinBarNC',       {fg=colors.base03, bg=colors.base01, attr=nil,            sp=nil})
hi('WinSeparator',   {fg=colors.base02, bg=colors.base02, attr=nil,            sp=nil})
hi('Boolean',        {fg=colors.base09, bg=nil,      attr=nil, sp=nil})
hi('Character',      {fg=colors.base08, bg=nil,      attr=nil, sp=nil})
hi('Comment',        {fg=colors.base03, bg=nil,      attr=nil, sp=nil})
hi('Conditional',    {fg=colors.base0E, bg=nil,      attr=nil, sp=nil})
hi('Constant',       {fg=colors.base09, bg=nil,      attr=nil, sp=nil})
hi('Debug',          {fg=colors.base08, bg=nil,      attr=nil, sp=nil})
hi('Define',         {fg=colors.base0E, bg=nil,      attr=nil, sp=nil})
hi('Delimiter',      {fg=colors.base0F, bg=nil,      attr=nil, sp=nil})
hi('Error',          {fg=colors.base00, bg=colors.base08, attr=nil, sp=nil})
hi('Exception',      {fg=colors.base08, bg=nil,      attr=nil, sp=nil})
hi('Float',          {fg=colors.base09, bg=nil,      attr=nil, sp=nil})
hi('Function',       {fg=colors.base0D, bg=nil,      attr=nil, sp=nil})
hi('Identifier',     {fg=colors.base08, bg=nil,      attr=nil, sp=nil})
hi('Ignore',         {fg=colors.base0C, bg=nil,      attr=nil, sp=nil})
hi('Include',        {fg=colors.base0D, bg=nil,      attr=nil, sp=nil})
hi('Keyword',        {fg=colors.base0E, bg=nil,      attr=nil, sp=nil})
hi('Label',          {fg=colors.base0A, bg=nil,      attr=nil, sp=nil})
hi('Macro',          {fg=colors.base08, bg=nil,      attr=nil, sp=nil})
hi('Number',         {fg=colors.base09, bg=nil,      attr=nil, sp=nil})
hi('Operator',       {fg=colors.base05, bg=nil,      attr=nil, sp=nil})
hi('PreCondit',      {fg=colors.base0A, bg=nil,      attr=nil, sp=nil})
hi('PreProc',        {fg=colors.base0A, bg=nil,      attr=nil, sp=nil})
hi('Repeat',         {fg=colors.base0A, bg=nil,      attr=nil, sp=nil})
hi('Special',        {fg=colors.base0C, bg=nil,      attr=nil, sp=nil})
hi('SpecialChar',    {fg=colors.base0F, bg=nil,      attr=nil, sp=nil})
hi('SpecialComment', {fg=colors.base0C, bg=nil,      attr=nil, sp=nil})
hi('Statement',      {fg=colors.base08, bg=nil,      attr=nil, sp=nil})
hi('StorageClass',   {fg=colors.base0A, bg=nil,      attr=nil, sp=nil})
hi('String',         {fg=colors.base0B, bg=nil,      attr=nil, sp=nil})
hi('Structure',      {fg=colors.base0E, bg=nil,      attr=nil, sp=nil})
hi('Tag',            {fg=colors.base0A, bg=nil,      attr=nil, sp=nil})
hi('Todo',           {fg=colors.base0A, bg=colors.base01, attr=nil, sp=nil})
hi('Type',           {fg=colors.base0A, bg=nil,      attr=nil, sp=nil})
hi('Typedef',        {fg=colors.base0A, bg=nil,      attr=nil, sp=nil})
hi('Bold',       {fg=nil,      bg=nil, attr='bold',      sp=nil})
hi('Italic',     {fg=nil,      bg=nil, attr='italic',    sp=nil})
hi('TooLong',    {fg=colors.base08, bg=nil, attr=nil,         sp=nil})
hi('Underlined', {fg=nil,      bg=nil, attr='underline', sp=nil})
hi('Added',       {fg=colors.base0B, bg=nil, attr=nil, sp=nil})
hi('Changed',     {fg=colors.base0E, bg=nil, attr=nil, sp=nil})
hi('Removed',     {fg=colors.base08, bg=nil, attr=nil, sp=nil})

-- diagnostic
hi('DiagnosticError', {fg=colors.base08, bg=nil, attr=nil, sp=nil})
hi('DiagnosticHint',  {fg=colors.base0D, bg=nil, attr=nil, sp=nil})
hi('DiagnosticInfo',  {fg=colors.base0C, bg=nil, attr=nil, sp=nil})
hi('DiagnosticOk',    {fg=colors.base0B, bg=nil, attr=nil, sp=nil})
hi('DiagnosticWarn',  {fg=colors.base0E, bg=nil, attr=nil, sp=nil})
hi('DiagnosticFloatingError', {fg=colors.base08, bg=colors.base01, attr=nil, sp=nil})
hi('DiagnosticFloatingHint',  {fg=colors.base0D, bg=colors.base01, attr=nil, sp=nil})
hi('DiagnosticFloatingInfo',  {fg=colors.base0C, bg=colors.base01, attr=nil, sp=nil})
hi('DiagnosticFloatingOk',    {fg=colors.base0B, bg=colors.base01, attr=nil, sp=nil})
hi('DiagnosticFloatingWarn',  {fg=colors.base0E, bg=colors.base01, attr=nil, sp=nil})
hi('DiagnosticSignError', {link='DiagnosticFloatingError'})
hi('DiagnosticSignHint',  {link='DiagnosticFloatingHint'})
hi('DiagnosticSignInfo',  {link='DiagnosticFloatingInfo'})
hi('DiagnosticSignOk',    {link='DiagnosticFloatingOk'})
hi('DiagnosticSignWarn',  {link='DiagnosticFloatingWarn'})
hi('DiagnosticUnderlineError', {fg=nil, bg=nil, attr='underline', sp=colors.base08})
hi('DiagnosticUnderlineHint',  {fg=nil, bg=nil, attr='underline', sp=colors.base0D})
hi('DiagnosticUnderlineInfo',  {fg=nil, bg=nil, attr='underline', sp=colors.base0C})
hi('DiagnosticUnderlineOk',    {fg=nil, bg=nil, attr='underline', sp=colors.base0B})
hi('DiagnosticUnderlineWarn',  {fg=nil, bg=nil, attr='underline', sp=colors.base0E})

-- lsp
hi('LspReferenceText',  {fg=nil, bg=colors.base02, attr=nil, sp=nil})
hi('LspReferenceRead',  {link='LspReferenceText'})
hi('LspReferenceWrite', {link='LspReferenceText'})
hi('LspSignatureActiveParameter', {link='LspReferenceText'})
hi('LspCodeLens',          {link='Comment'})
hi('LspCodeLensSeparator', {link='Comment'})

hi('@keyword.return', {fg=colors.base08, bg=nil, attr=nil, sp=nil})
hi('@symbol',         {fg=colors.base0E, bg=nil, attr=nil, sp=nil})
hi('@variable',       {fg=colors.base05, bg=nil, attr=nil, sp=nil})
hi('@text.strong',    {fg=nil, bg=nil, attr='bold',          sp=nil})
hi('@text.emphasis',  {fg=nil, bg=nil, attr='italic',        sp=nil})
hi('@text.strike',    {fg=nil, bg=nil, attr='strikethrough', sp=nil})
hi('@text.underline', {link='Underlined'})

hi('@lsp.type.variable',      {fg=colors.base05, bg=nil, attr=nil, sp=nil})
hi('@lsp.mod.defaultLibrary', {link='Special'})
hi('@lsp.mod.deprecated',     {fg=colors.base08, bg=nil, attr=nil, sp=nil})

hi('@markup.strong',        {link='@text.strong'})
hi('@markup.italic',        {link='@text.emphasis'})
hi('@markup.strikethrough', {link='@text.strike'})
hi('@markup.underline',     {link='@text.underline'})
hi('@string.special.vimdoc',     {link='SpecialChar'})
hi('@variable.parameter.vimdoc', {fg=colors.base09, bg=nil, attr=nil, sp=nil})

-- echasnovski/mini.nvim
hi('MiniCursorword',        {fg=nil, bg=nil, attr='underline', sp=nil})
hi('MiniCursorwordCurrent', {fg=nil, bg=nil, attr='underline', sp=nil})
hi('MiniJump', {link='SpellRare'})
hi('MiniOperatorsExchangeFrom', {link='IncSearch'})
hi('MiniStatuslineDevinfo',     {fg=colors.base04, bg=colors.base02, attr=nil,    sp=nil})
hi('MiniStatuslineFileinfo',    {link='MiniStatuslineDevinfo'})
hi('MiniStatuslineFilename',    {fg=colors.base03, bg=colors.base01, attr=nil,    sp=nil})
hi('MiniStatuslineInactive',    {link='MiniStatuslineFilename'})
hi('MiniStatuslineModeCommand', {fg=colors.base00, bg=colors.base08, attr='bold', sp=nil})
hi('MiniStatuslineModeInsert',  {fg=colors.base00, bg=colors.base0D, attr='bold', sp=nil})
hi('MiniStatuslineModeNormal',  {fg=colors.base00, bg=colors.base05, attr='bold', sp=nil})
hi('MiniStatuslineModeOther',   {fg=colors.base00, bg=colors.base03, attr='bold', sp=nil})
hi('MiniStatuslineModeReplace', {fg=colors.base00, bg=colors.base0E, attr='bold', sp=nil})
hi('MiniStatuslineModeVisual',  {fg=colors.base00, bg=colors.base0B, attr='bold', sp=nil})
hi('MiniSurround', {link='IncSearch'})
hi('MiniTrailspace', {link='Error'})

-- folke/lazy.nvim
hi('LazyButton',       {fg=nil, bg=colors.base01, attr=nil,    sp=nil})
hi('LazyButtonActive', {fg=nil, bg=colors.base02, attr=nil,    sp=nil})
hi('LazyDimmed',       {link='Comment'})
hi('LazyH1',           {fg=nil, bg=colors.base02, attr='bold', sp=nil})

-- folke/trouble.nvim
hi('TroubleCount',           {fg=colors.base0B, bg=nil, attr='bold', sp=nil})
hi('TroubleFoldIcon',        {fg=colors.base05, bg=nil, attr=nil,    sp=nil})
hi('TroubleIndent',          {fg=colors.base02, bg=nil, attr=nil,    sp=nil})
hi('TroubleLocation',        {fg=colors.base04, bg=nil, attr=nil,    sp=nil})
hi('TroubleSignError',       {link='DiagnosticError'})
hi('TroubleSignHint',        {link='DiagnosticHint'})
hi('TroubleSignInformation', {link='DiagnosticInfo'})
hi('TroubleSignOther',       {link='DiagnosticInfo'})
hi('TroubleSignWarning',     {link='DiagnosticWarn'})
hi('TroubleText',            {fg=colors.base05, bg=nil, attr=nil,    sp=nil})
hi('TroubleTextError',       {link='TroubleText'})
hi('TroubleTextHint',        {link='TroubleText'})
hi('TroubleTextInformation', {link='TroubleText'})
hi('TroubleTextWarning',     {link='TroubleText'})

-- hrsh7th/nvim-cmp
hi('CmpItemAbbr',           {fg=colors.base05, bg=nil,      attr=nil,    sp=nil})
hi('CmpItemAbbrDeprecated', {fg=colors.base03, bg=nil,      attr=nil,    sp=nil})
hi('CmpItemAbbrMatch',      {fg=colors.base0A, bg=nil,      attr='bold', sp=nil})
hi('CmpItemAbbrMatchFuzzy', {fg=colors.base0A, bg=nil,      attr='bold', sp=nil})
hi('CmpItemKind',           {fg=colors.base0F, bg=colors.base01, attr=nil,    sp=nil})
hi('CmpItemMenu',           {fg=colors.base05, bg=colors.base01, attr=nil,    sp=nil})
hi('CmpItemKindClass',         {link='Type'})
hi('CmpItemKindColor',         {link='Special'})
hi('CmpItemKindConstant',      {link='Constant'})
hi('CmpItemKindConstructor',   {link='Type'})
hi('CmpItemKindEnum',          {link='Structure'})
hi('CmpItemKindEnumMember',    {link='Structure'})
hi('CmpItemKindEvent',         {link='Exception'})
hi('CmpItemKindField',         {link='Structure'})
hi('CmpItemKindFile',          {link='Tag'})
hi('CmpItemKindFolder',        {link='Directory'})
hi('CmpItemKindFunction',      {link='Function'})
hi('CmpItemKindInterface',     {link='Structure'})
hi('CmpItemKindKeyword',       {link='Keyword'})
hi('CmpItemKindMethod',        {link='Function'})
hi('CmpItemKindModule',        {link='Structure'})
hi('CmpItemKindOperator',      {link='Operator'})
hi('CmpItemKindProperty',      {link='Structure'})
hi('CmpItemKindReference',     {link='Tag'})
hi('CmpItemKindSnippet',       {link='Special'})
hi('CmpItemKindStruct',        {link='Structure'})
hi('CmpItemKindText',          {link='Statement'})
hi('CmpItemKindTypeParameter', {link='Type'})
hi('CmpItemKindUnit',          {link='Special'})
hi('CmpItemKindValue',         {link='Identifier'})
hi('CmpItemKindVariable',      {link='Delimiter'})

-- lewis6991/gitsigns.nvim
hi('GitSignsAdd',             {fg=colors.base0B, bg=colors.base01, attr=nil, sp=nil})
hi('GitSignsAddLn',           {link='GitSignsAdd'})
hi('GitSignsAddInline',       {link='GitSignsAdd'})
hi('GitSignsChange',          {fg=colors.base0E, bg=colors.base01, attr=nil, sp=nil})
hi('GitSignsChangeLn',        {link='GitSignsChange'})
hi('GitSignsChangeInline',    {link='GitSignsChange'})
hi('GitSignsDelete',          {fg=colors.base08, bg=colors.base01, attr=nil, sp=nil})
hi('GitSignsDeleteLn',        {link='GitSignsDelete'})
hi('GitSignsDeleteInline',    {link='GitSignsDelete'})
hi('GitSignsUntracked',       {fg=colors.base0D, bg=colors.base01, attr=nil, sp=nil})
hi('GitSignsUntrackedLn',     {link='GitSignsUntracked'})
hi('GitSignsUntrackedInline', {link='GitSignsUntracked'})

-- nvim-telescope/telescope.nvim
hi('TelescopeBorder',         {fg=colors.base0F, bg=nil,      attr=nil,    sp=nil})
hi('TelescopeMatching',       {fg=colors.base0A, bg=nil,      attr=nil,    sp=nil})
hi('TelescopeMultiSelection', {fg=nil,      bg=colors.base01, attr='bold', sp=nil})
hi('TelescopeSelection',      {fg=nil,      bg=colors.base01, attr='bold', sp=nil})

-- nvim-tree/nvim-tree.lua
hi('NvimTreeExecFile',     {fg=colors.base0B, bg=nil,      attr='bold',           sp=nil})
hi('NvimTreeFolderIcon',   {fg=colors.base03, bg=nil,      attr=nil,              sp=nil})
hi('NvimTreeGitDeleted',   {fg=colors.base08, bg=nil,      attr=nil,              sp=nil})
hi('NvimTreeGitDirty',     {fg=colors.base08, bg=nil,      attr=nil,              sp=nil})
hi('NvimTreeGitMerge',     {fg=colors.base0C, bg=nil,      attr=nil,              sp=nil})
hi('NvimTreeGitNew',       {fg=colors.base0A, bg=nil,      attr=nil,              sp=nil})
hi('NvimTreeGitRenamed',   {fg=colors.base0E, bg=nil,      attr=nil,              sp=nil})
hi('NvimTreeGitStaged',    {fg=colors.base0B, bg=nil,      attr=nil,              sp=nil})
hi('NvimTreeImageFile',    {fg=colors.base0E, bg=nil,      attr='bold',           sp=nil})
hi('NvimTreeIndentMarker', {link='NvimTreeFolderIcon'})
hi('NvimTreeOpenedFile',   {link='NvimTreeExecFile'})
hi('NvimTreeRootFolder',   {link='NvimTreeGitRenamed'})
hi('NvimTreeSpecialFile',  {fg=colors.base0D, bg=nil,      attr='bold,underline', sp=nil})
hi('NvimTreeSymlink',      {fg=colors.base0F, bg=nil,      attr='bold',           sp=nil})
hi('NvimTreeWindowPicker', {fg=colors.base05, bg=colors.base01, attr="bold",           sp=nil})

-- williamboman/mason.nvim
hi('MasonError',                       {fg=colors.base08, bg=nil,      attr=nil,    sp=nil})
hi('MasonHeader',                      {fg=colors.base00, bg=colors.base0D, attr='bold', sp=nil})
hi('MasonHeaderSecondary',             {fg=colors.base00, bg=colors.base0F, attr='bold', sp=nil})
hi('MasonHeading',                     {link='Bold'})
hi('MasonHighlight',                   {fg=colors.base0F, bg=nil,      attr=nil,    sp=nil})
hi('MasonHighlightBlock',              {fg=colors.base00, bg=colors.base0F, attr=nil,    sp=nil})
hi('MasonHighlightBlockBold',          {link='MasonHeaderSecondary'})
hi('MasonHighlightBlockBoldSecondary', {link='MasonHeader'})
hi('MasonHighlightBlockSecondary',     {fg=colors.base00, bg=colors.base0D, attr=nil,    sp=nil})
hi('MasonHighlightSecondary',          {fg=colors.base0D, bg=nil,      attr=nil,    sp=nil})
hi('MasonLink',                        {link='MasonHighlight'})
hi('MasonMuted',                       {link='Comment'})
hi('MasonMutedBlock',                  {fg=colors.base00, bg=colors.base03, attr=nil,    sp=nil})
hi('MasonMutedBlockBold',              {fg=colors.base00, bg=colors.base03, attr='bold', sp=nil})

-- terminal colors
-- vim.g.terminal_color_0 = colors.base00
-- vim.g.terminal_color_1 = colors.base08
-- vim.g.terminal_color_2 = colors.base0B
-- vim.g.terminal_color_3 = colors.base0A
-- vim.g.terminal_color_4 = colors.base0D
-- vim.g.terminal_color_5 = colors.base0E
-- vim.g.terminal_color_6 = colors.base0C
-- vim.g.terminal_color_7 = colors.base05
-- vim.g.terminal_color_8 = colors.base03
-- vim.g.terminal_color_9 = colors.base08
-- vim.g.terminal_color_10 = colors.base0B
-- vim.g.terminal_color_11 = colors.base0A
-- vim.g.terminal_color_12 = colors.base0D
-- vim.g.terminal_color_13 = colors.base0E
-- vim.g.terminal_color_14 = colors.base0C
-- vim.g.terminal_color_15 = colors.base07

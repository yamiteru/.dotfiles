local H = {}

H.highlight_both = function(group, args)
  if args.link ~= nil then
    vim.cmd(string.format('highlight! link %s %s', group, args.link))
  else
    vim.cmd(string.format(
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
    ))
  end
end

H.nearest_rgb_id = function(rgb_target, rgb_palette)
  local best_dist = math.huge
  local best_id, dist
  for id, rgb in pairs(rgb_palette) do
    dist = math.abs(rgb_target.r - rgb.r) + math.abs(rgb_target.g - rgb.g) + math.abs(rgb_target.b - rgb.b)
    if dist < best_dist then
      best_id, best_dist = id, dist
    end
  end

  return best_id
end

H.hex2rgb = function(hex)
  local dec = tonumber(hex:sub(2), 16)

  local b = math.fmod(dec, 256)
  local g = math.fmod((dec - b) / 256, 256)
  local r = math.floor(dec / 65536)

  return { r = r, g = g, b = b }
end

H.rgb_palette_to_cterm_palette = function(palette)
  H.ensure_cterm_palette()

  return vim.tbl_map(function(hex) return H.nearest_rgb_id(H.hex2rgb(hex), H.cterm_palette) end, palette)
end

H.make_compound_palette = function(palette)
  local cterm_table = H.rgb_palette_to_cterm_palette(palette)

  local res = {}

  for name, _ in pairs(palette) do
    res[name] = { gui = palette[name], cterm = cterm_table[name] }
  end

  return res
end

H.apply_colorscheme = function(palette)
	if vim.g.colors_name then vim.cmd('highlight clear') end

  vim.g.colors_name = nil

  local p = H.make_compound_palette(palette, true)
	local hi = H.highlight_both

	-- Builtin
  hi('ColorColumn',    {fg=nil,      bg=p.base01, attr=nil,            sp=nil})
  hi('ComplMatchIns',  {fg=nil,      bg=nil,      attr=nil,            sp=nil})
  hi('Conceal',        {fg=p.base0D, bg=nil,      attr=nil,            sp=nil})
  hi('CurSearch',      {fg=p.base01, bg=p.base09, attr=nil,            sp=nil})
  hi('Cursor',         {fg=p.base00, bg=p.base05, attr=nil,            sp=nil})
  hi('CursorColumn',   {fg=nil,      bg=p.base01, attr=nil,            sp=nil})
  hi('CursorIM',       {fg=p.base00, bg=p.base05, attr=nil,            sp=nil})
  hi('CursorLine',     {fg=nil,      bg=p.base01, attr=nil,            sp=nil})
  hi('CursorLineFold', {fg=p.base0C, bg=p.base01, attr=nil,            sp=nil})
  hi('CursorLineNr',   {fg=p.base04, bg=p.base01, attr=nil,            sp=nil})
  hi('CursorLineSign', {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
  hi('DiffAdd',        {fg=p.base0B, bg=p.base01, attr=nil,            sp=nil})
	
  hi('DiffChange',     {fg=p.base0E, bg=p.base01, attr=nil,            sp=nil})
  hi('DiffDelete',     {fg=p.base08, bg=p.base01, attr=nil,            sp=nil})
  hi('DiffText',       {fg=p.base0D, bg=p.base01, attr=nil,            sp=nil})
  hi('Directory',      {fg=p.base0D, bg=nil,      attr=nil,            sp=nil})
  hi('EndOfBuffer',    {fg=p.base03, bg=nil,      attr=nil,            sp=nil})
  hi('ErrorMsg',       {fg=p.base08, bg=p.base00, attr=nil,            sp=nil})
  hi('FoldColumn',     {fg=p.base0C, bg=p.base01, attr=nil,            sp=nil})
  hi('Folded',         {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
  hi('IncSearch',      {fg=p.base01, bg=p.base09, attr=nil,            sp=nil})
  hi('lCursor',        {fg=p.base00, bg=p.base05, attr=nil,            sp=nil})
  hi('LineNr',         {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
  hi('LineNrAbove',    {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
  hi('LineNrBelow',    {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
	
  hi('MatchParen',     {fg=nil,      bg=p.base02, attr=nil,            sp=nil})
  hi('ModeMsg',        {fg=p.base0B, bg=nil,      attr=nil,            sp=nil})
  hi('MoreMsg',        {fg=p.base0B, bg=nil,      attr=nil,            sp=nil})
  hi('MsgArea',        {fg=p.base05, bg=p.base00, attr=nil,            sp=nil})
  hi('MsgSeparator',   {fg=p.base04, bg=p.base02, attr=nil,            sp=nil})
  hi('NonText',        {fg=p.base03, bg=nil,      attr=nil,            sp=nil})
  hi('Normal',         {fg=p.base05, bg=p.base00, attr=nil,            sp=nil})
  hi('NormalFloat',    {fg=p.base05, bg=p.base01, attr=nil,            sp=nil})
  hi('NormalNC',       {fg=p.base05, bg=p.base00, attr=nil,            sp=nil})
  hi('Pmenu',          {fg=p.base05, bg=p.base01, attr=nil,            sp=nil})
  hi('PmenuExtra',     {fg=p.base05, bg=p.base01, attr=nil,            sp=nil})
  hi('PmenuExtraSel',  {fg=p.base05, bg=p.base01, attr='reverse',      sp=nil})
  hi('PmenuKind',      {fg=p.base05, bg=p.base01, attr=nil,            sp=nil})
  hi('PmenuKindSel',   {fg=p.base05, bg=p.base01, attr='reverse',      sp=nil})
  hi('PmenuMatch',     {fg=p.base05, bg=p.base01, attr='bold',         sp=nil})
  hi('PmenuMatchSel',  {fg=p.base05, bg=p.base01, attr='bold,reverse', sp=nil})
  hi('PmenuSbar',      {fg=nil,      bg=p.base02, attr=nil,            sp=nil})
  hi('PmenuSel',       {fg=p.base05, bg=p.base01, attr='reverse',      sp=nil})
  hi('PmenuThumb',     {fg=nil,      bg=p.base07, attr=nil,            sp=nil})
  hi('Question',       {fg=p.base0D, bg=nil,      attr=nil,            sp=nil})
  hi('QuickFixLine',   {fg=nil,      bg=p.base01, attr=nil,            sp=nil})
  hi('Search',         {fg=p.base01, bg=p.base0A, attr=nil,            sp=nil})
  hi('SignColumn',     {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
  hi('SpecialKey',     {fg=p.base03, bg=nil,      attr=nil,            sp=nil})
  hi('SpellBad',       {fg=nil,      bg=nil,      attr='undercurl',    sp=p.base08})
  hi('SpellCap',       {fg=nil,      bg=nil,      attr='undercurl',    sp=p.base0D})
  hi('SpellLocal',     {fg=nil,      bg=nil,      attr='undercurl',    sp=p.base0C})
  hi('SpellRare',      {fg=nil,      bg=nil,      attr='undercurl',    sp=p.base0E})
  hi('StatusLine',     {fg=p.base04, bg=p.base02, attr=nil,            sp=nil})
  hi('StatusLineNC',   {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
  hi('Substitute',     {fg=p.base01, bg=p.base0A, attr=nil,            sp=nil})
  hi('TabLine',        {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
  hi('TabLineFill',    {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
  hi('TabLineSel',     {fg=p.base0B, bg=p.base01, attr=nil,            sp=nil})
  hi('TermCursor',     {fg=nil,      bg=nil,      attr='reverse',      sp=nil})
  hi('TermCursorNC',   {fg=nil,      bg=nil,      attr='reverse',      sp=nil})
  hi('Title',          {fg=p.base0D, bg=nil,      attr=nil,            sp=nil})
  hi('VertSplit',      {fg=p.base02, bg=p.base02, attr=nil,            sp=nil})
  hi('Visual',         {fg=nil,      bg=p.base02, attr=nil,            sp=nil})
  hi('VisualNOS',      {fg=p.base08, bg=nil,      attr=nil,            sp=nil})
  hi('WarningMsg',     {fg=p.base08, bg=nil,      attr=nil,            sp=nil})
  hi('Whitespace',     {fg=p.base03, bg=nil,      attr=nil,            sp=nil})
  hi('WildMenu',       {fg=p.base08, bg=p.base0A, attr=nil,            sp=nil})
  hi('WinBar',         {fg=p.base04, bg=p.base02, attr=nil,            sp=nil})
  hi('WinBarNC',       {fg=p.base03, bg=p.base01, attr=nil,            sp=nil})
  hi('WinSeparator',   {fg=p.base02, bg=p.base02, attr=nil,            sp=nil})

  hi('Boolean',        {fg=p.base09, bg=nil,      attr=nil, sp=nil})
  hi('Character',      {fg=p.base08, bg=nil,      attr=nil, sp=nil})
  hi('Comment',        {fg=p.base03, bg=nil,      attr=nil, sp=nil})
  hi('Conditional',    {fg=p.base0E, bg=nil,      attr=nil, sp=nil})
  hi('Constant',       {fg=p.base09, bg=nil,      attr=nil, sp=nil})
  hi('Debug',          {fg=p.base08, bg=nil,      attr=nil, sp=nil})
  hi('Define',         {fg=p.base0E, bg=nil,      attr=nil, sp=nil})
  hi('Delimiter',      {fg=p.base0F, bg=nil,      attr=nil, sp=nil})
  hi('Error',          {fg=p.base00, bg=p.base08, attr=nil, sp=nil})
  hi('Exception',      {fg=p.base08, bg=nil,      attr=nil, sp=nil})
  hi('Float',          {fg=p.base09, bg=nil,      attr=nil, sp=nil})
  hi('Function',       {fg=p.base0D, bg=nil,      attr=nil, sp=nil})
  hi('Identifier',     {fg=p.base08, bg=nil,      attr=nil, sp=nil})
  hi('Ignore',         {fg=p.base0C, bg=nil,      attr=nil, sp=nil})
  hi('Include',        {fg=p.base0D, bg=nil,      attr=nil, sp=nil})
  hi('Keyword',        {fg=p.base0E, bg=nil,      attr=nil, sp=nil})
  hi('Label',          {fg=p.base0A, bg=nil,      attr=nil, sp=nil})
  hi('Macro',          {fg=p.base08, bg=nil,      attr=nil, sp=nil})
  hi('Number',         {fg=p.base09, bg=nil,      attr=nil, sp=nil})
  hi('Operator',       {fg=p.base05, bg=nil,      attr=nil, sp=nil})
  hi('PreCondit',      {fg=p.base0A, bg=nil,      attr=nil, sp=nil})
  hi('PreProc',        {fg=p.base0A, bg=nil,      attr=nil, sp=nil})
  hi('Repeat',         {fg=p.base0A, bg=nil,      attr=nil, sp=nil})
  hi('Special',        {fg=p.base0C, bg=nil,      attr=nil, sp=nil})
  hi('SpecialChar',    {fg=p.base0F, bg=nil,      attr=nil, sp=nil})
  hi('SpecialComment', {fg=p.base0C, bg=nil,      attr=nil, sp=nil})
  hi('Statement',      {fg=p.base08, bg=nil,      attr=nil, sp=nil})
  hi('StorageClass',   {fg=p.base0A, bg=nil,      attr=nil, sp=nil})
  hi('String',         {fg=p.base0B, bg=nil,      attr=nil, sp=nil})
  hi('Structure',      {fg=p.base0E, bg=nil,      attr=nil, sp=nil})
  hi('Tag',            {fg=p.base0A, bg=nil,      attr=nil, sp=nil})
  hi('Todo',           {fg=p.base0A, bg=p.base01, attr=nil, sp=nil})
  hi('Type',           {fg=p.base0A, bg=nil,      attr=nil, sp=nil})
  hi('Typedef',        {fg=p.base0A, bg=nil,      attr=nil, sp=nil})

  hi('Bold',       {fg=nil,      bg=nil, attr='bold',      sp=nil})
  hi('Italic',     {fg=nil,      bg=nil, attr='italic',    sp=nil})
  hi('TooLong',    {fg=p.base08, bg=nil, attr=nil,         sp=nil})
  hi('Underlined', {fg=nil,      bg=nil, attr='underline', sp=nil})

  -- Patch diff
  hi('diffAdded',   {fg=p.base0B, bg=nil, attr=nil, sp=nil})
  hi('diffChanged', {fg=p.base0E, bg=nil, attr=nil, sp=nil})
  hi('diffFile',    {fg=p.base09, bg=nil, attr=nil, sp=nil})
  hi('diffLine',    {fg=p.base0C, bg=nil, attr=nil, sp=nil})
  hi('diffRemoved', {fg=p.base08, bg=nil, attr=nil, sp=nil})
  hi('Added',       {fg=p.base0B, bg=nil, attr=nil, sp=nil})
  hi('Changed',     {fg=p.base0E, bg=nil, attr=nil, sp=nil})
  hi('Removed',     {fg=p.base08, bg=nil, attr=nil, sp=nil})

	-- Built-in diagnostic
  hi('DiagnosticError', {fg=p.base08, bg=nil, attr=nil, sp=nil})
  hi('DiagnosticHint',  {fg=p.base0D, bg=nil, attr=nil, sp=nil})
  hi('DiagnosticInfo',  {fg=p.base0C, bg=nil, attr=nil, sp=nil})
  hi('DiagnosticOk',    {fg=p.base0B, bg=nil, attr=nil, sp=nil})
  hi('DiagnosticWarn',  {fg=p.base0E, bg=nil, attr=nil, sp=nil})

  hi('DiagnosticFloatingError', {fg=p.base08, bg=p.base01, attr=nil, sp=nil})
  hi('DiagnosticFloatingHint',  {fg=p.base0D, bg=p.base01, attr=nil, sp=nil})
  hi('DiagnosticFloatingInfo',  {fg=p.base0C, bg=p.base01, attr=nil, sp=nil})
  hi('DiagnosticFloatingOk',    {fg=p.base0B, bg=p.base01, attr=nil, sp=nil})
  hi('DiagnosticFloatingWarn',  {fg=p.base0E, bg=p.base01, attr=nil, sp=nil})

  hi('DiagnosticSignError', {link='DiagnosticFloatingError'})
  hi('DiagnosticSignHint',  {link='DiagnosticFloatingHint'})
  hi('DiagnosticSignInfo',  {link='DiagnosticFloatingInfo'})
  hi('DiagnosticSignOk',    {link='DiagnosticFloatingOk'})
  hi('DiagnosticSignWarn',  {link='DiagnosticFloatingWarn'})

  hi('DiagnosticUnderlineError', {fg=nil, bg=nil, attr='underline', sp=p.base08})
  hi('DiagnosticUnderlineHint',  {fg=nil, bg=nil, attr='underline', sp=p.base0D})
  hi('DiagnosticUnderlineInfo',  {fg=nil, bg=nil, attr='underline', sp=p.base0C})
  hi('DiagnosticUnderlineOk',    {fg=nil, bg=nil, attr='underline', sp=p.base0B})
  hi('DiagnosticUnderlineWarn',  {fg=nil, bg=nil, attr='underline', sp=p.base0E})

  -- Built-in LSP
  hi('LspReferenceText',  {fg=nil, bg=p.base02, attr=nil, sp=nil})
  hi('LspReferenceRead',  {link='LspReferenceText'})
  hi('LspReferenceWrite', {link='LspReferenceText'})

  hi('LspSignatureActiveParameter', {link='LspReferenceText'})

  hi('LspCodeLens',          {link='Comment'})
  hi('LspCodeLensSeparator', {link='Comment'})

  -- Built-in snippets
  hi('SnippetTabstop', {link='Visual'})

	-- Indent blankline
	hi('IndentBlanklineChar',         {fg=p.base02, bg=nil, attr='nocombine',           sp=nil})
	hi('IndentBlanklineContextChar',  {fg=p.base0F, bg=nil, attr='nocombine',           sp=nil})
	hi('IndentBlanklineContextStart', {fg=nil,      bg=nil, attr='underline,nocombine', sp=p.base0F})
	hi('IndentBlanklineIndent1',      {fg=p.base08, bg=nil, attr='nocombine',           sp=nil})
	hi('IndentBlanklineIndent2',      {fg=p.base09, bg=nil, attr='nocombine',           sp=nil})
	hi('IndentBlanklineIndent3',      {fg=p.base0A, bg=nil, attr='nocombine',           sp=nil})
	hi('IndentBlanklineIndent4',      {fg=p.base0B, bg=nil, attr='nocombine',           sp=nil})
	hi('IndentBlanklineIndent5',      {fg=p.base0C, bg=nil, attr='nocombine',           sp=nil})
	hi('IndentBlanklineIndent6',      {fg=p.base0D, bg=nil, attr='nocombine',           sp=nil})
	hi('IndentBlanklineIndent7',      {fg=p.base0E, bg=nil, attr='nocombine',           sp=nil})
	hi('IndentBlanklineIndent8',      {fg=p.base0F, bg=nil, attr='nocombine',           sp=nil})

	-- Mason
	hi('MasonError',                       {fg=p.base08, bg=nil,      attr=nil,    sp=nil})
	hi('MasonHeader',                      {fg=p.base00, bg=p.base0D, attr='bold', sp=nil})
	hi('MasonHeaderSecondary',             {fg=p.base00, bg=p.base0F, attr='bold', sp=nil})
	hi('MasonHeading',                     {link='Bold'})
	hi('MasonHighlight',                   {fg=p.base0F, bg=nil,      attr=nil,    sp=nil})
	hi('MasonHighlightBlock',              {fg=p.base00, bg=p.base0F, attr=nil,    sp=nil})
	hi('MasonHighlightBlockBold',          {link='MasonHeaderSecondary'})
	hi('MasonHighlightBlockBoldSecondary', {link='MasonHeader'})
	hi('MasonHighlightBlockSecondary',     {fg=p.base00, bg=p.base0D, attr=nil,    sp=nil})
	hi('MasonHighlightSecondary',          {fg=p.base0D, bg=nil,      attr=nil,    sp=nil})
	hi('MasonLink',                        {link='MasonHighlight'})
	hi('MasonMuted',                       {link='Comment'})
	hi('MasonMutedBlock',                  {fg=p.base00, bg=p.base03, attr=nil,    sp=nil})
	hi('MasonMutedBlockBold',              {fg=p.base00, bg=p.base03, attr='bold', sp=nil})

	-- Trouble
	hi('TroubleCount',           {fg=p.base0B, bg=nil, attr='bold', sp=nil})
	hi('TroubleFoldIcon',        {fg=p.base05, bg=nil, attr=nil,    sp=nil})
	hi('TroubleIndent',          {fg=p.base02, bg=nil, attr=nil,    sp=nil})
	hi('TroubleLocation',        {fg=p.base04, bg=nil, attr=nil,    sp=nil})
	hi('TroubleSignError',       {link='DiagnosticError'})
	hi('TroubleSignHint',        {link='DiagnosticHint'})
	hi('TroubleSignInformation', {link='DiagnosticInfo'})
	hi('TroubleSignOther',       {link='DiagnosticInfo'})
	hi('TroubleSignWarning',     {link='DiagnosticWarn'})
	hi('TroubleText',            {fg=p.base05, bg=nil, attr=nil,    sp=nil})
	hi('TroubleTextError',       {link='TroubleText'})
	hi('TroubleTextHint',        {link='TroubleText'})
	hi('TroubleTextInformation', {link='TroubleText'})
	hi('TroubleTextWarning',     {link='TroubleText'})

	-- Lazy
	hi('LazyButton',       {fg=nil, bg=p.base01, attr=nil,    sp=nil})
	hi('LazyButtonActive', {fg=nil, bg=p.base02, attr=nil,    sp=nil})
	hi('LazyDimmed',       {link='Comment'})
	hi('LazyH1',           {fg=nil, bg=p.base02, attr='bold', sp=nil})

	-- Mini
	hi('MiniAnimateCursor',      {fg=nil, bg=nil, attr='reverse,nocombine', sp=nil})
	hi('MiniAnimateNormalFloat', {link='NormalFloat'})

	hi('MiniClueBorder',              {link='NormalFloat'})
	hi('MiniClueDescGroup',           {link='DiagnosticFloatingWarn'})
	hi('MiniClueDescSingle',          {link='NormalFloat'})
	hi('MiniClueNextKey',             {link='DiagnosticFloatingHint'})
	hi('MiniClueNextKeyWithPostkeys', {link='DiagnosticFloatingError'})
	hi('MiniClueSeparator',           {link='DiagnosticFloatingInfo'})
	hi('MiniClueTitle',               {fg=p.base0D, bg=p.base01, attr='bold', sp=nil})

	hi('MiniCompletionActiveParameter', {fg=nil, bg=p.base02, attr=nil, sp=nil})

	hi('MiniCursorword',        {fg=nil, bg=nil, attr='underline', sp=nil})
	hi('MiniCursorwordCurrent', {fg=nil, bg=nil, attr='underline', sp=nil})

	hi('MiniDepsChangeAdded',   {link='diffAdded'})
	hi('MiniDepsChangeRemoved', {link='diffRemoved'})
	hi('MiniDepsHint',          {link='DiagnosticHint'})
	hi('MiniDepsInfo',          {link='DiagnosticInfo'})
	hi('MiniDepsMsgBreaking',   {link='DiagnosticWarn'})
	hi('MiniDepsPlaceholder',   {link='Comment'})
	hi('MiniDepsTitle',         {link='Title'})
	hi('MiniDepsTitleError',    {link='DiffDelete'})
	hi('MiniDepsTitleSame',     {link='DiffText'})
	hi('MiniDepsTitleUpdate',   {link='DiffAdd'})

	hi('MiniDiffSignAdd',     {fg=p.base0B, bg=p.base01, attr=nil, sp=nil})
	hi('MiniDiffSignChange',  {fg=p.base0E, bg=p.base01, attr=nil, sp=nil})
	hi('MiniDiffSignDelete',  {fg=p.base08, bg=p.base01, attr=nil, sp=nil})
	hi('MiniDiffOverAdd',     {link='DiffAdd'})
	hi('MiniDiffOverChange',  {link='DiffText'})
	hi('MiniDiffOverContext', {link='DiffChange'})
	hi('MiniDiffOverDelete',  {link='DiffDelete'})

	hi('MiniFilesBorder',         {link='NormalFloat'})
	hi('MiniFilesBorderModified', {link='DiagnosticFloatingWarn'})
	hi('MiniFilesCursorLine',     {fg=nil,      bg=p.base02, attr=nil,    sp=nil})
	hi('MiniFilesDirectory',      {link='Directory'})
	hi('MiniFilesFile',           {fg=p.base05, bg=nil,      attr=nil,    sp=nil})
	hi('MiniFilesNormal',         {link='NormalFloat'})
	hi('MiniFilesTitle',          {fg=p.base0D, bg=p.base01, attr=nil,    sp=nil})
	hi('MiniFilesTitleFocused',   {fg=p.base0D, bg=p.base01, attr='bold', sp=nil})

	hi('MiniHipatternsFixme', {fg=p.base00, bg=p.base08, attr='bold', sp=nil})
	hi('MiniHipatternsHack',  {fg=p.base00, bg=p.base0E, attr='bold', sp=nil})
	hi('MiniHipatternsNote',  {fg=p.base00, bg=p.base0D, attr='bold', sp=nil})
	hi('MiniHipatternsTodo',  {fg=p.base00, bg=p.base0C, attr='bold', sp=nil})

	hi('MiniIconsAzure',  {fg=p.base0D, bg=nil, attr=nil, sp=nil})
	hi('MiniIconsBlue',   {fg=p.base0F, bg=nil, attr=nil, sp=nil})
	hi('MiniIconsCyan',   {fg=p.base0C, bg=nil, attr=nil, sp=nil})
	hi('MiniIconsGreen',  {fg=p.base0B, bg=nil, attr=nil, sp=nil})
	hi('MiniIconsGrey',   {fg=p.base07, bg=nil, attr=nil, sp=nil})
	hi('MiniIconsOrange', {fg=p.base09, bg=nil, attr=nil, sp=nil})
	hi('MiniIconsPurple', {fg=p.base0E, bg=nil, attr=nil, sp=nil})
	hi('MiniIconsRed',    {fg=p.base08, bg=nil, attr=nil, sp=nil})
	hi('MiniIconsYellow', {fg=p.base0A, bg=nil, attr=nil, sp=nil})

	hi('MiniIndentscopeSymbol',    {fg=p.base0F, bg=nil, attr=nil, sp=nil})
	hi('MiniIndentscopeSymbolOff', {fg=p.base08, bg=nil, attr=nil, sp=nil})

	hi('MiniJump', {link='SpellRare'})

	hi('MiniJump2dDim',        {link='Comment'})
	hi('MiniJump2dSpot',       {fg=p.base07, bg=p.base01, attr='bold,nocombine', sp=nil})
	hi('MiniJump2dSpotAhead',  {fg=p.base06, bg=p.base00, attr='nocombine',      sp=nil})
	hi('MiniJump2dSpotUnique', {link='MiniJump2dSpot'})

	hi('MiniMapNormal',      {fg=p.base05, bg=p.base01, attr=nil, sp=nil})
	hi('MiniMapSymbolCount', {fg=p.base0C, bg=nil,      attr=nil, sp=nil})
	hi('MiniMapSymbolLine',  {fg=p.base0D, bg=nil,      attr=nil, sp=nil})
	hi('MiniMapSymbolView',  {fg=p.base0F, bg=nil,      attr=nil, sp=nil})

	hi('MiniNotifyBorder', {link='NormalFloat'})
	hi('MiniNotifyNormal', {link='NormalFloat'})
	hi('MiniNotifyTitle',  {link='FloatTitle'})

	hi('MiniOperatorsExchangeFrom', {link='IncSearch'})

	hi('MiniPickBorder',        {link='NormalFloat'})
	hi('MiniPickBorderBusy',    {fg=p.base0E, bg=p.base01, attr=nil,         sp=nil})
	hi('MiniPickBorderText',    {fg=p.base0D, bg=p.base01, attr='bold',      sp=nil})
	hi('MiniPickCursor',        {fg=nil,      bg=nil,      attr='nocombine', sp=nil, blend=100})
	hi('MiniPickIconDirectory', {link='Directory'})
	hi('MiniPickIconFile',      {fg=p.base05, bg=nil,      attr=nil,         sp=nil})
	hi('MiniPickHeader',        {link='DiagnosticFloatingHint'})
	hi('MiniPickMatchCurrent',  {fg=nil,      bg=p.base02, attr=nil,         sp=nil})
	hi('MiniPickMatchMarked',   {fg=nil,      bg=p.base03, attr=nil,         sp=nil})
	hi('MiniPickMatchRanges',   {link='DiagnosticFloatingHint'})
	hi('MiniPickNormal',        {link='NormalFloat'})
	hi('MiniPickPreviewLine',   {fg=nil,      bg=p.base02, attr=nil,         sp=nil})
	hi('MiniPickPreviewRegion', {link='IncSearch'})
	hi('MiniPickPrompt',        {fg=p.base0B, bg=p.base01, attr=nil,         sp=nil})

	hi('MiniSnippetsCurrent',        {fg=nil, bg=nil, attr='underdouble', sp=p.base0E})
	hi('MiniSnippetsCurrentReplace', {fg=nil, bg=nil, attr='underdouble', sp=p.base08})
	hi('MiniSnippetsFinal',          {fg=nil, bg=nil, attr='underdouble', sp=p.base0B})
	hi('MiniSnippetsUnvisited',      {fg=nil, bg=nil, attr='underdouble', sp=p.base0D})
	hi('MiniSnippetsVisited',        {fg=nil, bg=nil, attr='underdouble', sp=p.base0C})

	hi('MiniStarterCurrent',    {fg=nil,      bg=nil, attr=nil,    sp=nil})
	hi('MiniStarterFooter',     {fg=p.base0D, bg=nil, attr=nil,    sp=nil})
	hi('MiniStarterHeader',     {fg=p.base0D, bg=nil, attr=nil,    sp=nil})
	hi('MiniStarterInactive',   {link='Comment'})
	hi('MiniStarterItem',       {fg=p.base05, bg=nil, attr=nil,    sp=nil})
	hi('MiniStarterItemBullet', {fg=p.base0F, bg=nil, attr=nil,    sp=nil})
	hi('MiniStarterItemPrefix', {fg=p.base08, bg=nil, attr='bold', sp=nil})
	hi('MiniStarterSection',    {fg=p.base0F, bg=nil, attr=nil,    sp=nil})
	hi('MiniStarterQuery',      {fg=p.base0B, bg=nil, attr='bold', sp=nil})

	hi('MiniStatuslineDevinfo',     {fg=p.base04, bg=p.base02, attr=nil,    sp=nil})
	hi('MiniStatuslineFileinfo',    {link='MiniStatuslineDevinfo'})
	hi('MiniStatuslineFilename',    {fg=p.base03, bg=p.base01, attr=nil,    sp=nil})
	hi('MiniStatuslineInactive',    {link='StatusLineNC'})
	hi('MiniStatuslineModeCommand', {fg=p.base00, bg=p.base08, attr='bold', sp=nil})
	hi('MiniStatuslineModeInsert',  {fg=p.base00, bg=p.base0D, attr='bold', sp=nil})
	hi('MiniStatuslineModeNormal',  {fg=p.base00, bg=p.base05, attr='bold', sp=nil})
	hi('MiniStatuslineModeOther',   {fg=p.base00, bg=p.base03, attr='bold', sp=nil})
	hi('MiniStatuslineModeReplace', {fg=p.base00, bg=p.base0E, attr='bold', sp=nil})
	hi('MiniStatuslineModeVisual',  {fg=p.base00, bg=p.base0B, attr='bold', sp=nil})

	hi('MiniSurround', {link='IncSearch'})

	hi('MiniTablineCurrent',         {fg=p.base05, bg=p.base02, attr='bold', sp=nil})
	hi('MiniTablineFill',            {fg=nil,      bg=nil,      attr=nil,    sp=nil})
	hi('MiniTablineHidden',          {fg=p.base04, bg=p.base01, attr=nil,    sp=nil})
	hi('MiniTablineModifiedCurrent', {fg=p.base02, bg=p.base05, attr='bold', sp=nil})
	hi('MiniTablineModifiedHidden',  {fg=p.base01, bg=p.base04, attr=nil,    sp=nil})
	hi('MiniTablineModifiedVisible', {fg=p.base02, bg=p.base04, attr='bold', sp=nil})
	hi('MiniTablineTabpagesection',  {fg=p.base01, bg=p.base0A, attr='bold', sp=nil})
	hi('MiniTablineVisible',         {fg=p.base05, bg=p.base01, attr='bold', sp=nil})

	hi('MiniTestEmphasis', {fg=nil,      bg=nil, attr='bold', sp=nil})
	hi('MiniTestFail',     {fg=p.base08, bg=nil, attr='bold', sp=nil})
	hi('MiniTestPass',     {fg=p.base0B, bg=nil, attr='bold', sp=nil})

	hi('MiniTrailspace', {link='Error'})

	-- Treesitter
	hi('@keyword.return', {fg=p.base08, bg=nil, attr=nil, sp=nil})
  hi('@symbol',         {fg=p.base0E, bg=nil, attr=nil, sp=nil})
  hi('@variable',       {fg=p.base05, bg=nil, attr=nil, sp=nil})

  hi('@text.strong',    {fg=nil, bg=nil, attr='bold',          sp=nil})
  hi('@text.emphasis',  {fg=nil, bg=nil, attr='italic',        sp=nil})
  hi('@text.strike',    {fg=nil, bg=nil, attr='strikethrough', sp=nil})
  hi('@text.underline', {link='Underlined'})
	hi('@markup.strong',        {link='@text.strong'})
	hi('@markup.italic',        {link='@text.emphasis'})
	hi('@markup.strikethrough', {link='@text.strike'})
	hi('@markup.underline',     {link='@text.underline'})

	hi('@string.special.vimdoc',     {link='SpecialChar'})
	hi('@variable.parameter.vimdoc', {fg=p.base09, bg=nil, attr=nil, sp=nil})

  -- Terminal colors
  vim.g.terminal_color_0 = palette.base00
  vim.g.terminal_color_1 = palette.base08
  vim.g.terminal_color_2 = palette.base0B
  vim.g.terminal_color_3 = palette.base0A
  vim.g.terminal_color_4 = palette.base0D
  vim.g.terminal_color_5 = palette.base0E
  vim.g.terminal_color_6 = palette.base0C
  vim.g.terminal_color_7 = palette.base05
  vim.g.terminal_color_8 = palette.base03
  vim.g.terminal_color_9 = palette.base08
  vim.g.terminal_color_10 = palette.base0B
  vim.g.terminal_color_11 = palette.base0A
  vim.g.terminal_color_12 = palette.base0D
  vim.g.terminal_color_13 = palette.base0E
  vim.g.terminal_color_14 = palette.base0C
  vim.g.terminal_color_15 = palette.base07
end

return H

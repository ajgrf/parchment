" parchment - a vim colorscheme inspired by Acme and Leuven
" Maintainer: Alex Griffin <a@ajgrf.com>
" Version:    0.5.0-pre
" License:    This file is placed under an ISC-style license.  See the included
"             LICENSE file for details.

" Top Matter {{{

highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'parchment'

" color palette
let s:black =        [ 0, '#000000']
let s:red =          [ 1, '#880000']
let s:green =        [ 2, '#005500']
let s:brown =        [ 3, '#663311']
let s:blue =         [ 4, '#004488']
let s:magenta =      [ 5, '#770077']
let s:cyan =         [ 6, '#007777']
let s:beige =        [ 7, '#eeeecc']
let s:pale_gray =    [ 8, '#eaeaea']
let s:pale_red =     [ 9, '#ffeaea']
let s:pale_green =   [10, '#eaffea']
let s:yellow =       [11, '#eeee9e']
let s:pale_blue =    [12, '#cceeff']
let s:pale_magenta = [13, '#ffeaff']
let s:pale_cyan =    [14, '#eaffff']
let s:pale_yellow =  [15, '#ffffea']
let s:shadow =       [ 6, '#808075']

" Sets the text color, background color, and attributes for the given
" highlight group, in both terminal and gui vim. The values of a:hlgroup and
" a:attr are directly inserted into a highlight command.
function! s:Style(hlgroup, fg, bg, attr)
  let l:ctermfg = a:fg   == [] ? 'NONE' : a:fg[0]
  let l:ctermbg = a:bg   == [] ? 'NONE' : a:bg[0]
  let l:guifg   = a:fg   == [] ? 'NONE' : a:fg[1]
  let l:guibg   = a:bg   == [] ? 'NONE' : a:bg[1]
  let l:attr    = a:attr == '' ? 'NONE' : a:attr

  execute 'highlight ' . a:hlgroup . ' ctermfg=' . l:ctermfg . ' ctermbg=' .
    \ l:ctermbg . ' cterm=' . l:attr . ' guifg=' . l:guifg . ' guibg=' .
    \ l:guibg . ' gui=' . l:attr
endfunction

" }}}

" Standard Syntax Highlighting Groups {{{

""           HIGHLIGHT GROUP   TEXT           BACKGROUND      ATTRIBUTES
call s:Style('Normal',         s:black,       s:pale_yellow,  '')
call s:Style('Constant',       [],            [],             '')
call s:Style('Identifier',     [],            [],             '')
call s:Style('Ignore',         [],            [],             '')
call s:Style('Type',           s:blue,        [],             '')
call s:Style('Statement',      [],            [],             '')
call s:Style('Comment',        s:brown,       [],             'italic')
call s:Style('String',         s:green,       [],             '')
call s:Style('Special',        s:magenta,     [],             '')
call s:Style('SpecialComment', s:brown,       [],             '')
call s:Style('PreProc',        [],            [],             '')
call s:Style('Underlined',     [],            [],             'underline')
call s:Style('Error',          s:red,         [],             '')
call s:Style('Todo',           s:blue,        [],             'bold')
call s:Style('MatchParen',     [],            s:pale_blue,    '')
call s:Style('Delimiter',      [],            [],             '')

" }}}

" FileType-specific Tweaks {{{

""           HIGHLIGHT GROUP   TEXT           BACKGROUND      ATTRIBUTES
call s:Style('diffAdded',      s:green,       s:pale_green,   '')
call s:Style('diffFile',       s:magenta,     [],             '')
call s:Style('diffIndexLine',  s:magenta,     [],             '')
call s:Style('diffLine',       s:magenta,     s:pale_magenta, '')
call s:Style('diffRemoved',    s:red,         s:pale_red,     '')
call s:Style('diffSubname',    s:magenta,     s:pale_magenta, '')
call s:Style('gitcommitBranch',[],            [],             'italic')
call s:Style('gitcommitHeader',s:brown,       [],             'italic')
call s:Style('gitcommitSelectedType', s:brown,[],             'italic')
call s:Style('gitcommitType',  s:brown,       [],             'italic')
call s:Style('helpExample',    s:blue,        [],             '')
call s:Style('htmlH1',         s:black,       s:pale_gray,    'bold')
call s:Style('htmlH2',         s:blue,        s:pale_cyan,    'bold')
call s:Style('htmlH3',         s:green,       s:pale_green,   'bold')
call s:Style('htmlH4',         s:brown,       [],             'bold')
call s:Style('htmlH5',         s:magenta,     [],             'bold')
call s:Style('htmlH6',         s:cyan,        [],             'bold,italic')
call s:Style('hyperlink',      s:cyan,        [],             'underline')
call s:Style('LedgerNegativeNumber', s:red,   [],             '')
call s:Style('LedgerPending',  [],            [],             'bold')
call s:Style('mailEmail',      s:cyan,        [],             '')
call s:Style('mailHeaderEmail',s:cyan,        [],             '')
call s:Style('mailHeaderKey',  s:magenta,     [],             '')
call s:Style('mailHeader',     s:blue,        [],             '')
call s:Style('mailQuoted1',    s:blue,        [],             'italic')
call s:Style('mailQuoted2',    s:green,       [],             'italic')
call s:Style('mailQuoted3',    s:brown,       [],             'italic')
call s:Style('mailQuoted4',    s:blue,        [],             'italic')
call s:Style('mailQuoted5',    s:green,       [],             'italic')
call s:Style('mailQuoted6',    s:brown,       [],             'italic')
call s:Style('mailSignature',  [],            [],             'italic')
call s:Style('mailSubject',    s:black,       s:pale_gray,    'bold')
call s:Style('mailURL',        s:cyan,        [],             'underline')
call s:Style('markdownH1',     s:black,       s:pale_gray,    'bold')
call s:Style('markdownH2',     s:blue,        s:pale_cyan,    'bold')
call s:Style('markdownH2Delimiter', s:blue,   s:pale_cyan,    'bold')
call s:Style('markdownH3',     s:green,       s:pale_green,   'bold')
call s:Style('markdownH3Delimiter', s:green,  s:pale_green,   'bold')
call s:Style('markdownH4',     s:brown,       [],             'bold')
call s:Style('markdownH4Delimiter', s:brown,  [],             'bold')
call s:Style('markdownH5',     s:magenta,     [],             'bold')
call s:Style('markdownH5Delimiter', s:magenta,[],             'bold')
call s:Style('markdownH6',     s:cyan,        [],             'bold,italic')
call s:Style('markdownH6Delimiter', s:cyan,   [],             'bold,italic')
call s:Style('markdownHeadingRule', [],       [],             'bold')
call s:Style('markdownHeadingDelimiter', s:black, s:pale_gray, 'bold')
call s:Style('markdownBold',   [],            [],             'bold')
call s:Style('markdownItalic', [],            [],             'italic')
call s:Style('markdownBoldItalic', [],        [],             'bold,italic')
call s:Style('markdownBlockQuote', [],        [],             '')
call s:Style('markdownCode',   s:blue,        [],             '')
call s:Style('markdownCodeBlock', s:blue,     [],             '')
call s:Style('markdownLineBreak', s:cyan,     [],             'underline')
call s:Style('markdownUrl',    s:cyan,        [],             'underline')
call s:Style('markdownUrlTitleDelimiter', s:green, [],        '')
call s:Style('nroffEscape',    s:magenta,     [],             '')
call s:Style('nroffSpecial',   s:magenta,     [],             '')
call s:Style('org_block_delimiter', s:cyan,   s:pale_cyan,    '')
call s:Style('org_bold',       [],            [],             'bold')
call s:Style('org_code',       s:blue,        [],             '')
call s:Style('org_deadline_scheduled', s:cyan, s:pale_cyan,   'bold')
call s:Style('org_heading1',   s:black,       s:pale_gray,    'bold')
call s:Style('org_heading2',   s:blue,        s:pale_cyan,    'bold')
call s:Style('org_heading3',   s:green,       s:pale_green,   'bold')
call s:Style('org_heading4',   s:brown,       [],             'bold')
call s:Style('org_heading5',   s:magenta,     [],             'bold')
call s:Style('org_heading6',   s:cyan,        [],             'bold,italic')
call s:Style('org_heading7',   s:green,       [],             'bold,italic')
call s:Style('org_italic',     [],            [],             'italic')
call s:Style('org_key_identifier', s:cyan,    s:pale_cyan,    '')
call s:Style('org_properties_delimiter', s:cyan, s:pale_cyan, 'bold')
call s:Style('org_shade_stars',s:beige,       [],             '')
call s:Style('org_subtask_number_all', s:blue, s:pale_blue,   '')
call s:Style('org_subtask_number', s:red,     s:pale_red,     '')
call s:Style('org_subtask_percent_100', s:blue, s:pale_blue,  '')
call s:Style('org_subtask_percent', s:red,    s:pale_red,     '')
call s:Style('org_table_separator', s:green,  s:pale_green,   '')
call s:Style('org_table',      s:green,       s:pale_green,   '')
call s:Style('org_timestamp',  s:blue,        [],             '')
call s:Style('org_title',      [],            [],             'bold')
call s:Style('org_todo_keyword_DONE', s:blue, s:pale_blue,    'bold')
call s:Style('org_todo_keyword_TODO', s:red,  s:pale_red,     'bold')
call s:Style('org_underline',  [],            [],             'underline')
call s:Style('org_verbatim',   s:blue,        [],             '')
call s:Style('rstEmphasis',    [],            [],             'italic')
call s:Style('rstSections',    [],            [],             'bold')
call s:Style('rstSimpleTable', s:green,       s:pale_green,   '')
call s:Style('rstTable',       s:green,       s:pale_green,   '')
call s:Style('rstTableLines',  s:green,       s:pale_green,   '')
call s:Style('rstStandaloneHyperlink', s:cyan, [],            'underline')
call s:Style('rstInterpretedTextOrHyperlinkReference', s:cyan, [], 'underline')
call s:Style('rstHyperlinkReference', s:cyan, [],             'underline')
call s:Style('rstStrongEmphasis', [],         [],             'bold')
call s:Style('rstInlineLiteral', s:blue,      [],             '')
call s:Style('shCommandSub',   [],            [],             '')
call s:Style('shDeref',        s:magenta,     [],             '')
call s:Style('shEcho',         s:black,       [],             '')
call s:Style('shQuote',        s:green,       [],             '')
call s:Style('tmuxKey',        [],            [],             '')
call s:Style('tmuxFormatString', s:magenta,   [],             '')
call s:Style('today',          s:blue,        [],             'bold')
call s:Style('vimFuncSID',     [],            [],             '')
call s:Style('week_agenda',    s:blue,        [],             'bold')

" }}}

" Vim UI Highlight Groups {{{

""           HIGHLIGHT GROUP   TEXT           BACKGROUND      ATTRIBUTES
call s:Style('NonText',        s:cyan,        s:pale_cyan,    '')
call s:Style('EndOfBuffer',    [],            [],             'bold')
call s:Style('SpecialKey',     s:cyan,        s:pale_cyan,    '')
call s:Style('Conceal',        [],            [],             '')
call s:Style('LineNr',         [],            s:pale_gray,    '')
call s:Style('CursorLineNr',   [],            s:pale_gray,    '')
call s:Style('ErrorMsg',       s:pale_yellow, s:red,          'bold')
call s:Style('MoreMsg',        [],            [],             'bold')
call s:Style('ModeMsg',        [],            [],             'bold')
call s:Style('Question',       [],            [],             'bold')
call s:Style('Title',          s:magenta,     [],             '')
call s:Style('WarningMsg',     s:red,         [],             '')
call s:Style('Cursor',         [],            [],             'reverse')
call s:Style('lCursor',        s:pale_yellow, s:magenta,      '')
call s:Style('TermCursor',     [],            [],             'reverse')
call s:Style('TermCursorNC',   s:pale_yellow, s:cyan,         '')
call s:Style('Visual',         [],            s:yellow,       '')
call s:Style('VisualNOS',      [],            [],             'bold,underline')
call s:Style('TabLine',        [],            s:pale_gray,    '')
call s:Style('TabLineSel',     [],            s:pale_gray,    'bold')
call s:Style('TabLineFill',    [],            s:pale_gray,    '')
call s:Style('ColorColumn',    [],            s:pale_red,     '')
call s:Style('CursorColumn',   [],            s:beige,        '')
call s:Style('CursorLine',     [],            s:beige,        '')
call s:Style('VertSplit',      [],            s:pale_gray,    '')
call s:Style('StatusLine',     [],            s:pale_gray,    'bold')
call s:Style('StatusLineNC',   s:shadow,      s:pale_gray,    '')
call s:Style('WildMenu',       s:pale_yellow, s:cyan,         'bold')
call s:Style('Search',         [],            [],             'bold')
call s:Style('IncSearch',      [],            s:pale_blue,    'bold')
call s:Style('Directory',      s:blue,        [],             'bold')
call s:Style('DiffAdd',        s:green,       s:pale_green,   '')
call s:Style('DiffDelete',     s:red,         s:pale_red,     '')
call s:Style('DiffChange',     s:magenta,     s:pale_magenta, '')
call s:Style('DiffText',       s:magenta,     s:pale_magenta, 'bold')
call s:Style('Folded',         [],            s:pale_gray,    '')
call s:Style('FoldColumn',     [],            s:pale_gray,    '')
call s:Style('SignColumn',     [],            s:pale_gray,    '')
call s:Style('Pmenu',          [],            s:pale_cyan,    '')
call s:Style('PmenuSel',       s:pale_yellow, s:cyan,         'bold')
call s:Style('PmenuSbar',      [],            s:pale_cyan,    '')
call s:Style('PmenuThumb',     [],            s:cyan,         '')
call s:Style('SpellBad',       s:red,         [],             'undercurl')
call s:Style('SpellCap',       s:green,       [],             'undercurl')
call s:Style('SpellRare',      s:green,       [],             'undercurl')
call s:Style('SpellLocal',     s:green,       [],             'undercurl')
call s:Style('QuickFixLine',   [],            s:pale_blue,    '')

" }}}

" Terminal Colors {{{

let g:terminal_ansi_colors = [
  \s:black[1], s:red[1], s:green[1], s:brown[1], s:blue[1], s:magenta[1], s:cyan[1], s:beige[1],
  \s:black[1], s:red[1], s:green[1], s:brown[1], s:blue[1], s:magenta[1], s:cyan[1], s:pale_yellow[1]
  \]

let g:terminal_color_0 = s:black[1]
let g:terminal_color_1 = s:red[1]
let g:terminal_color_2 = s:green[1]
let g:terminal_color_3 = s:brown[1]
let g:terminal_color_4 = s:blue[1]
let g:terminal_color_5 = s:magenta[1]
let g:terminal_color_6 = s:cyan[1]
let g:terminal_color_7 = s:beige[1]
let g:terminal_color_8 = s:black[1]
let g:terminal_color_9 = s:red[1]
let g:terminal_color_10 = s:green[1]
let g:terminal_color_11 = s:brown[1]
let g:terminal_color_12 = s:blue[1]
let g:terminal_color_13 = s:magenta[1]
let g:terminal_color_14 = s:cyan[1]
let g:terminal_color_15 = s:pale_yellow[1]

" }}}

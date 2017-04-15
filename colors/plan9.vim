" plan9 - a vim colorscheme inspired by Plan 9 and Acme

" Top Matter {{{

highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "plan9"

" color palette
let s:black =   [0, '#000000']
let s:red =     [1, '#880000']
let s:green =   [2, '#004d00']
let s:yellow =  [3, '#eeee9e']
let s:blue =    [4, '#004488']
let s:magenta = [5, '#770077']
let s:cyan =    [6, '#eaffff']
let s:white =   [7, '#ffffea']

" need this to stay legible without the matching terminal theme
let s:text = &background == "dark" ? s:white : s:black

" Sets the text color, background color, and attributes for the given
" highlight group, in both terminal and gui vim. The values of a:hlgroup and
" a:attr are directly inserted into a highlight command.
function! s:Style(hlgroup, fg, bg, attr)
  let l:ctermfg = a:fg   == [] ? "NONE" : a:fg[0]
  let l:ctermbg = a:bg   == [] ? "NONE" : a:bg[0]
  let l:guifg   = a:fg   == [] ? "NONE" : a:fg[1]
  let l:guibg   = a:bg   == [] ? "NONE" : a:bg[1]
  let l:attr    = a:attr == "" ? "NONE" : a:attr

  execute "highlight " . a:hlgroup . " ctermfg=" . l:ctermfg . " ctermbg=" .
    \ l:ctermbg . " cterm=" . l:attr . " guifg=" . l:guifg . " guibg=" .
    \ l:guibg . " gui=" . l:attr
endfunction

" }}}

" Standard Syntax Highlighting Groups {{{

if has("gui_running")
  call s:Style("Normal", s:black, s:white, "")
else
  call s:Style("Normal", [], [], "")
endif

""           HIGHLIGHT GROUP   TEXT       BACKGROUND ATTRIBUTES
call s:Style("Constant",       [],        [],        "")
call s:Style("Identifier",     [],        [],        "")
call s:Style("Ignore",         [],        [],        "")
call s:Style("Type",           [],        [],        "")
call s:Style("Statement",      [],        [],        "")
call s:Style("Comment",        s:blue,    [],        "")
call s:Style("String",         s:green,   [],        "")
call s:Style("Special",        s:magenta, [],        "")
call s:Style("SpecialComment", s:blue,    [],        "")
call s:Style("PreProc",        [],        [],        "")
call s:Style("Underlined",     [],        [],        "underline")
call s:Style("Error",          s:white,   s:red,     "bold")
call s:Style("Todo",           s:blue,    [],        "bold")
call s:Style("MatchParen",     [],        s:yellow,  "")
call s:Style("Delimiter",      [],        [],        "")

" }}}

" FileType-specific Tweaks {{{

""           HIGHLIGHT GROUP   TEXT       BACKGROUND ATTRIBUTES
call s:Style("diffAdded",      s:green,   [],        "")
call s:Style("diffRemoved",    s:red,     [],        "")
call s:Style("LedgerNegativeNumber", s:red, [],      "")
call s:Style("LedgerPending",  [],        [],        "bold")
call s:Style("shCommandSub",   s:text,    [],        "")
call s:Style("shQuote",        s:green,   [],        "")
call s:Style("vimFuncSID",     s:text,    [],        "")

" }}}

" Vim UI Highlight Groups {{{

""           HIGHLIGHT GROUP   TEXT       BACKGROUND ATTRIBUTES
call s:Style("NonText",        [],        s:cyan,    "")
call s:Style("EndOfBuffer",    [],        [],        "bold")
call s:Style("SpecialKey",     [],        s:cyan,    "")
call s:Style("LineNr",         [],        s:cyan,    "")
call s:Style("CursorLineNr",   [],        s:cyan,    "")
call s:Style("ErrorMsg",       s:white,   s:red,     "bold")
call s:Style("MoreMsg",        [],        [],        "bold")
call s:Style("ModeMsg",        [],        [],        "bold")
call s:Style("Question",       [],        [],        "bold")
call s:Style("Title",          s:magenta, [],        "")
call s:Style("WarningMsg",     s:red,     [],        "")
call s:Style("Cursor",         [],        [],        "reverse")
call s:Style("lCursor",        s:white,   s:magenta, "")
call s:Style("Visual",         [],        s:yellow,  "")
call s:Style("VisualNOS",      [],        [],        "bold,underline")
call s:Style("TabLine",        [],        s:cyan,    "")
call s:Style("TabLineSel",     [],        s:cyan,    "bold")
call s:Style("TabLineFill",    [],        s:cyan,    "")
call s:Style("ColorColumn",    s:white,   s:red,     "")
call s:Style("CursorColumn",   [],        [],        "underline")
call s:Style("CursorLine",     [],        [],        "underline")
call s:Style("VertSplit",      [],        s:cyan,    "")
call s:Style("StatusLine",     s:white,   s:blue,    "bold")
call s:Style("StatusLineNC",   [],        s:cyan,    "")
call s:Style("WildMenu",       s:white,   s:magenta, "bold")
call s:Style("Search",         [],        [],        "bold")
call s:Style("IncSearch",      [],        s:yellow,  "bold")
call s:Style("Directory",      s:blue,    [],        "bold")
call s:Style("DiffAdd",        s:green,   [],        "")
call s:Style("DiffDelete",     s:red,     [],        "")
call s:Style("DiffChange",     s:magenta, [],        "")
call s:Style("DiffText",       s:magenta, [],        "bold")
call s:Style("Folded",         [],        s:cyan,    "")
call s:Style("FoldColumn",     [],        s:cyan,    "")
call s:Style("SignColumn",     [],        s:cyan,    "")
call s:Style("Pmenu",          [],        s:cyan,    "")
call s:Style("PmenuSel",       s:white,   s:blue,    "bold")
call s:Style("PmenuSbar",      [],        s:cyan,    "")
call s:Style("PmenuThumb",     [],        s:blue,    "")
call s:Style("SpellBad",       s:red,     [],        "underline")
call s:Style("SpellCap",       s:green,   [],        "underline")
call s:Style("SpellRare",      s:green,   [],        "underline")
call s:Style("SpellLocal",     s:green,   [],        "underline")

" Purposefully left unset: Conceal

" }}}

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match fmrNonTerminal /<\a\w*>/
" syn match fmrAny /(any)/ contained
syn region fmrAny start=/(/ end=/)/
syn match fmrFrame /\[\a\w*\]/
syn region fmrString start=/"/ skip=/\\"/ end=/"/ contained
syn region fmrFunction start=/{/ end=/}/ contained
syn region fmrRules start=/=/ skip=/\\"/ end=/;/ contains=fmrNonTerminal,fmrAny,fmrString,fmrFunction

hi link fmrNonTerminal	Type
hi link fmrAny	Keyword
hi link fmrFrame	Identifier
hi link fmrString	String
hi link fmrFunction	PreProc
hi link fmrRules	Special

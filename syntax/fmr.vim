if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match fmrNonTerminal /<\a\w*>/
syn match fmrAny /(any)/ contained
syn match fmrFrame /\[\a\w*\]/
syn region xString start=/"/ skip=/\\"/ end=/"/ contained
syn region fmrFunction start=/{/ end=/}/ contained
syn region xRules start=/=/ skip=/\\"/ end=/;/ contains=fmrNonTerminal,fmrAny,xString,fmrFunction

hi link fmrNonTerminal	Type
hi link fmrAny	Keyword
hi link fmrFrame	Identifier
hi link xString 	String
hi link fmrFunction 	PreProc
hi link xRules   Special

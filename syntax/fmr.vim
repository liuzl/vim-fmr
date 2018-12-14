if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match fmrInclude /#\s*include\s*"/ nextgroup=fmrString contains=fmrString
syn match fmrNonTerminal /<\a\w*>/
syn region fmrAny start=/(/ end=/)/
syn region fmrRegex start=/`/ end=/`/
syn match fmrFrame /\[\a\w*\]/
syn region fmrString start=/"/ skip=/\\"/ end=/"/ contained
syn region fmrFunction start=/{/ end=/}/ contained

syn region fmrRules start=/=/ skip=/\\"/ end=/;/ contains=fmrNonTerminal,fmrAny,fmrString,fmrFunction,fmrComment,fmrLineComment,fmrRegex
syn region fmrLineComment start=/\/\// end=/\n/
syn region fmrComment start=/\/\*/ end=/\*\//

hi link fmrNonTerminal Type
hi link fmrAny         Keyword
hi link fmrRegex       Keyword
hi link fmrFrame       Identifier
hi link fmrString      String
hi link fmrRules       Special
hi link fmrInclude     Include
hi link fmrLineComment Comment
hi link fmrComment     Comment

hi fmrFunction ctermfg=208

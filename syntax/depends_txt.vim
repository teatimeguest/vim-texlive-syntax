if v:version < 600
  syntax clear
elseif exists('b:current_syntax') && b:current_syntax ==# 'depends_txt'
  finish
endif

syntax iskeyword -,48-57,a-z,_

syntax match dependsTxtTodo
  \ display
  \ contained
  \ '\<\%(TODO\|FIXME\|XXX\)\>'

syntax match dependsTxtInvalidCharacter
  \ display
  \ contained
  \ '[^[:space:][:keyword:]]'

syntax region dependsTxtComment
  \ display
  \ start='\s*#' end='$'
  \ contains=dependsTxtTodo,@Spell
  \ keepend oneline

syntax region dependsTxtInvalidArgument
  \ display
  \ contained
  \ start='\S' end='$'
  \ contains=dependsTxtComment
  \ keepend oneline

syntax region dependsTxtMissingArgument
  \ display
  \ contained
  \ start='#' end='$'
  \ keepend oneline

syntax region dependsTxtPackages
  \ display
  \ start='\K' end='$'
  \ contains=
  \   dependsTxtComment,
  \   dependsTxtInvalidCharacter
  \ keepend oneline

syntax match dependsTxtPackage
  \ display
  \ contained
  \ '\<\K\k*\>'
  \ contains=
  \   dependsTxtComment,
  \   dependsTxtInvalidCharacter
  \ skipwhite
  \ nextgroup=dependsTxtInvalidArgument

syntax keyword dependsTxtDirective hard soft
  \ skipwhite
  \ nextgroup=dependsTxtPackages

syntax keyword dependsTxtDirective package
  \ skipwhite
  \ nextgroup=
  \   dependsTxtPackage,
  \   dependsTxtMissingArgument

highlight def link dependsTxtInvalidCharacter dependsTxtError
highlight def link dependsTxtMissingArgument dependsTxtError
highlight def link dependsTxtInvalidArgument dependsTxtError

highlight def link dependsTxtTodo Todo
highlight def link dependsTxtComment Comment
highlight def link dependsTxtPackages Type
highlight def link dependsTxtPackage Type
highlight def link dependsTxtError Error
highlight def link dependsTxtDirective Statement

let b:current_syntax = 'depends_txt'

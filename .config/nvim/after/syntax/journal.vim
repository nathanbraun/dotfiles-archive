" Header levels, 1-6
for s:i in range(1,6)
  execute 'syntax match VimwikiHeader'.s:i.' /'.g:vimwiki_rxH{s:i}.'/ contains=VimwikiTodo,VimwikiHeaderChar,VimwikiNoExistsLink,VimwikiCode,VimwikiLink,@Spell'
  execute 'syntax region VimwikiH'.s:i.'Folding start=/'.g:vimwiki_rxH{s:i}_Start.
        \ '/ end=/'.g:vimwiki_rxH{s:i}_End.'/me=s-1 transparent fold'
endfor

syntax  match  TodoProject    '\(^\|\W\)+[^[:blank:]]\+'        contains=VimwikiTodo
syntax  match  TodoContext    '\(^\|\W\)@[^[:blank:]]\+'        contains=VimwikiTodo

hi def link TodoProject       Constant
hi def link TodoContext      Statement

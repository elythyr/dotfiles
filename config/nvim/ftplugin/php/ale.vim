if 2 != exists(':ALEEnable')
  finish
endif

call ale#Set('php_php_cs_fixer_options', '')
call ale#Set('php_php_cs_fixer_executable', 'php-cs-fixer')
call ale#Set('php_php_cs_fixer_use_global', get(g:, 'ale_use_global_executables', 0))

function! s:ale_linters_php_php_cs_fixer_GetCommand(buffer) abort
  return '%e fix --dry-run --format gitlab --show-progress none --using-cache=no --no-interaction'
    \ . ale#Pad(ale#Var(a:buffer, 'php_php_cs_fixer_options'))
    \ . ' -'
endfunction

function! s:ale_linters_php_php_cs_fixer_Handle(buffer, lines) abort
  let l:errors = {}
  let l:output = []

  try
    for l:line in a:lines
      for l:error in json_decode(l:line)
        let l:lnum = l:error.location.lines.begin + 0
        let l:text = l:error.description

        if !has_key(l:errors, l:lnum)
          let l:errors[l:lnum] = []
        endif

        call add(l:errors[l:lnum], l:text)
      endfor
    endfor
  endtry


  for [l:lnum, l:texts] in items(l:errors)
    call add(l:output, {
      \ 'lnum': lnum,
      \ 'text': join(texts, ', '),
      \ 'sub_type': 'style'
    \ })
  endfor

  return l:output
endfunction

call ale#linter#Define('php', {
  \ 'name': 'php_cs_fixer',
  \ 'executable': {buffer -> ale#path#FindExecutable(buffer, 'php_php_cs_fixer', [
    \ 'vendor/bin/php-cs-fixer',
    \ 'php-cs-fixer'
  \ ])},
  \ 'command': function('<SID>ale_linters_php_php_cs_fixer_GetCommand'),
  \ 'callback': function('<SID>ale_linters_php_php_cs_fixer_Handle')
\ })

" vim: ts=2 sw=2 et fdm=marker

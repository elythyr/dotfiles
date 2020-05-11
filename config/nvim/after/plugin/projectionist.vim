if !exists('g:loaded_projectionist') || 2 != exists(':FZF')
  finish
endif

function! s:create_commands() abort
  for [command, patterns] in items(projectionist#navigation_commands())
    let command = get(g:, 'fzfProjectionistCmdPrefix', '') .
      \ s:capitalize(s:remove_non_letters(command))

    execute 'command! -buffer -bang' command
      \ ':call s:fzf_projections("'. command .'", <bang>0, '. string(patterns) .')'
  endfor
endfunction

function! s:capitalize(string, ...) abort
  let all = !a:0 || a:1

  return substitute(a:string, '\%(^\|_\|-\|\s\)\zs\a', '\u&', all ? 'g' : '')
endfunction

function! s:remove_non_letters(string) abort
  return substitute(a:string, '\A', '', 'g')
endfunction

function! s:fzf_projections(name, bang, variants)
  let formats = []
  for variant in a:variants
    call add(formats, variant[0] . projectionist#slash() . (variant[1] =~# '\*\*'
          \ ? variant[1] : substitute(variant[1], '\*', '**/*', '')))
  endfor

  let source = []
  for format in formats
    let source += map(projectionist#glob(format), 'fnamemodify(v:val, ":~:.")')
  endfor

  call fzf#run(fzf#wrap('fzf_projectionist_'. a:name, {
    \ 'source': uniq(sort(source)),
  \ }, a:bang))
endfunction

augroup fzf_projectionist
  autocmd!
  autocmd User ProjectionistActivate call s:create_commands()
augroup END

" vim: ts=2 sw=2 fdm=marker

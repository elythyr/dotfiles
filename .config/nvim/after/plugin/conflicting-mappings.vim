" Regroups mappings that conflicts between plugins
" This is the place to resolve them

" <BS> {{{
function! s:insertBackspace() abort " {{{
  let l:cocIsLoaded = exists(':CocInstall')
  let l:autoPairsIsLoaded = exists('*AutoPairsDelete')
  let l:result = ''

  if !l:cocIsLoaded && !l:autoPairsIsLoaded
    return "\<BS>"
  endif

  if l:autoPairsIsLoaded
    let l:result .= AutoPairsDelete()
  endif

  if l:cocIsLoaded
    let l:result .= "\<C-r>=coc#refresh()\<CR>"
  endif

  return l:result
endfunction
" }}}

inoremap <unique> <silent> <expr> <BS> <SID>insertBackspace()
" }}}

" vim: fdm=marker

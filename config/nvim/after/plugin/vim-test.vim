function! s:DefineStrategy() " {{{1
  if has('nvim')
    return 'neovim'
  else
    return 'basic'
  endif
endfunction " 1}}}

" See vimux plugin and strategy when i will use tmux
let test#strategy = <SID>DefineStrategy()

" Possible if needed
" let test#strategy = {
"   \ 'nearest': 'neovim',
"   \ 'file':    'dispatch',
"   \ 'suite':   'basic',
" \}

" vim: ts=2 sw=2 et fdm=marker

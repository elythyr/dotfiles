if exists('*packager#init')
  call packager#add('FooSoft/vim-argwrap')
endif

nmap <silent> caw <Plug>(ArgWrapToggle)

" Also add a comma to the last item after wrapping for the listed pairs
let g:argwrap_tail_comma_braces = '['
" Wrap/Unwrap the opening brace of a method
let g:argwrap_php_smart_brace = 1

function! s:vimArgwrapConfig() abort
  let b:argwrap_tail_comma_braces = '[{'
  " Prefix to add at the begning of each line when wrapping
  let b:argwrap_line_prefix = '\ '
endfunction

augroup ely_argwrap
  autocmd!
  autocmd FileType vim call s:vimArgwrapConfig()
augroup END

" vim: ts=2 sw=2 et fdm=marker

if exists('*packager#init')
  call packager#add('FooSoft/vim-argwrap')
endif

nnoremap <silent> gaw :ArgWrap<CR>

let g:argwrap_tail_comma_braces = '['

" vim: ts=2 sw=2 et fdm=marker

" suppress the annoying 'match x of y', 'The only match'
" and 'Pattern not found' messages
set shortmess+=c
set completeopt+=longest,menuone

" Use <CR> to confirm completion
function! s:onEnter() abort " {{{
  let l:cocIsEnabled = !empty(g:coc_global_extensions)
  let l:confirm = "\<C-y>"
  " `<C-g>u` means break undo chain at current position.
  " Use it to be able to undo jus the <CR>
  " coc#on_enter() is used to let CoC known that enter was pressed
  let l:insertEnter = l:cocIsEnabled ? "\<CR>\<C-r>=coc#on_enter()\<CR>" : "\<CR>"
  let l:shouldConfirm = exists('*complete_info')
    \ ? -1 != complete_info()['selected']
    \ : 0 != pumvisible()

  return l:shouldConfirm ? l:confirm : l:insertEnter
endfunction " }}}

imap <expr> <silent> <CR> <SID>onEnter()

" vim: et ts=2 sw=2 fdm=marker

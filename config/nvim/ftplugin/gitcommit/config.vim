setlocal nocursorline

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
augroup gitcommit_open
  autocmd!
  autocmd BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END

" vim: ts=2 sw=2 et fdm=marker

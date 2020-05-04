" List of filetype by extension
" Add here all filetype which differ from their extension
let s:filetypes = {
  \ 'yml': 'yaml',
\ }

" Define the correct filetype for dist files
function! s:defineFiletype(file) abort
  let l:extension = substitute(a:file, '.*\.\(.\{-\}\)\.dist$', '\1', '')
  let l:filetype = get(s:filetypes, l:extension, l:extension)

  execute 'setfiletype' l:filetype
endfunction

augroup DistFiletype
  autocmd!
  autocmd BufEnter *.dist :call <SID>defineFiletype(expand('<afile>'))
augroup END

" vim: ts=2 sw=2

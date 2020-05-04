" Global PHP filetype configurations

" Options {{{

" foldlevelstart doesn't work for ftplugin
setlocal foldlevel=1 " To automaticaly open classes folds

" }}}

" Mappings {{{

" Open the phpdoc for the word under the cursor
nnoremap <buffer> <silent> <C-k> :silent execute ':!xdg-open ' .
  \ 'https://php.net/en/' . expand('<cword>')<CR>

" }}}

" Commands {{{

command! -buffer Repl botright split term://php\ -a | normal! i

" }}}

" vim:ts=2:sw=2:et:fdm=marker

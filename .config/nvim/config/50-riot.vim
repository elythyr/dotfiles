if exists('*packager#init')
  call packager#add('ryym/vim-riot')
endif

" To handle riot4 extensions
autocmd BufNewFile,BufRead *.riot setf riot

" vim: ts=2 sw=2 et fdm=marker

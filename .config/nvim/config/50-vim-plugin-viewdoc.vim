if exists('*packager#init')
  call packager#add('powerman/vim-plugin-viewdoc')
endif

let g:no_viewdoc_abbrev = 1 " Disable abbreviations
let g:no_viewdoc_maps = 1 " Disable mappings
let g:viewdoc_open = 'botright vnew' "How to open the help window
let g:viewdoc_openempty = 0 " Do not open window when doc is not found

" Somehow it does not work like that
" set keywordprg=:ViewDoc!\ <cword>
set keywordprg=:call\ ViewDoc('doc',\ '<cword>')

" vim:ts=2:sw=2:et:fdm=marker

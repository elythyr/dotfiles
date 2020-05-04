if exists('*packager#init')
  call packager#add('alvan/vim-closetag')
endif

let g:closetag_filetypes = 'html,xhtml,jsx,twig,riot,html.twig'
let g:closetag_xhtml_filetypes = 'html,xhtml,jsx,twig,riot,html.twig'

" vim: ts=2 sw=2 et fdm=marker

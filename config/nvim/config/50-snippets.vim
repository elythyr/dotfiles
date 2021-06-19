if exists('*packager#init')
  call packager#add('SirVer/ultisnips')
  call packager#add('honza/vim-snippets')
endif

let g:UltiSnipsExpandTrigger		= "<Tab>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" vim: ts=2 sw=2 et fdm=marker

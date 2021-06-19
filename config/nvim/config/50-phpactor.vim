if exists('*packager#init')
  call packager#add('phpactor/phpactor', {'do': 'composer install -o'})
  call packager#add('camilledejoye/phpactor-mappings')
endif

" phpactor {{{

" Use Phpactor for omni-completion
augroup elyphpactor
  autocmd!
  autocmd FileType php setlocal omnifunc=phpactor#Complete
augroup END

let g:phpactorOmniError = v:true " Enable useful error messages when completion is invoked

" Enable while Experimental
let g:phpactorInputListStrategy = 'phpactor#input#list#fzf'
let g:phpactorQuickfixStrategy = 'phpactor#quickfix#fzf'

" }}}

" phpactor-mapping {{{

let g:phpactorActivateOverlapingMappings = v:true

" Should be `pm` to be logic but `pp` is easiest and faster since I use it a lot
let g:phpactorCustomMappings = [
  \ ['<Leader>pp', '<Plug>phpactorContextMenu', 'n'],
  \ ['<Leader>pn', '<Plug>phpactorNavigate', 'n'],
  \ ['<Leader>pt', '<Plug>phpactorTransform', 'n'],
  \ ['<Leader>pe', '<Plug>phpactorClassExpand', 'n'],
  \ ['<Leader>pE', '<Plug>phpactorClassExpand <BAR> :normal! Bi\<CR>', 'n'],
\ ]

" }}}

" vim: et ts=2 sw=2 fdm=marker

if exists('*packager#init')
  call packager#add('phpactor/phpactor', {
    \ 'branch': 'develop',
    \ 'do': 'composer install -o'
  \ })
  call packager#add('elythyr/phpactor-mappings')
endif

" phpactor {{{

" Use Phpactor for omni-completion
augroup elyphpactor
  autocmd!
  autocmd FileType php setlocal omnifunc=phpactor#Complete
augroup END

let g:phpactorOmniError = v:true " Enable useful error messages when completion is invoked

" }}}

" phpactor-mapping {{{

" Enable while Experimental
let g:phpactorInputListStrategy = 'phpactor#input#list#fzf'
let g:phpactorQuickfixStrategy = 'phpactor#quickfix#fzf'

let g:phpactorActivateOverlapingMappings = v:true

" Should be `pm` to be logic but `pp` is easiest and faster since I use it a lot
let g:phpactorCustomMappings = [
  \ ['<Leader>pp', '<Plug>phpactorContextMenu', 'n'],
  \ ['<Leader>pn', '<Plug>phpactorNavigate', 'n'],
  \ ['<Leader>pt', '<Plug>phpactorTransform', 'n'],
\ ]

" }}}

" vim: et ts=2 sw=2 fdm=marker

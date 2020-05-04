if exists('*packager#init')
  call packager#add('vimwiki/vimwiki', { 'type': 'opt' })
endif

let g:vimwiki_map_prefix = '<Leader>n'
let g:vimwiki_list = [{'path': '~/vimwiki/',
  \ 'syntax': 'markdown', 'ext': '.md'}]

" Vimwiki has a feature called "Temporary Wikis", that will treat every file
" with configured file-extension as a wiki.
let g:vimwiki_global_ext = 0 " .md files are not automatically considered as a wiki

nnoremap <silent><Leader>nw :unmap <Leader>nw<BAR>packadd vimwiki<BAR>VimwikiTabIndex<CR>

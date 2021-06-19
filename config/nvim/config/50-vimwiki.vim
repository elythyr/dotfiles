if exists('*packager#init')
  call packager#add('vimwiki/vimwiki', { 'type': 'opt' })
endif

let g:vimwiki_map_prefix = '<Leader>n'
let g:vimwiki_list = [
  \ {
      \ 'path': '~/.local/share/vimwiki/',
      \ 'syntax': 'markdown',
      \ 'ext': '.md',
      \ 'auto_toc': 1,
      \ 'links_space_char': '-',
      \ 'auto_diary_index': 1,
  \ },
  \ {
      \ 'path': '~/vimwiki/',
      \ 'syntax': 'markdown',
      \ 'ext': '.md',
      \ 'auto_toc': 1,
      \ 'links_space_char': '-',
      \ 'auto_diary_index': 1,
  \ },
\ ]

" Vimwiki has a feature called "Temporary Wikis", that will treat every file
" with configured file-extension as a wiki.
let g:vimwiki_global_ext = 0 " .md files are not automatically considered as a wiki

nnoremap <silent><Leader>nw :unmap <Leader>nw<BAR>packadd vimwiki<BAR>VimwikiTabIndex<CR>

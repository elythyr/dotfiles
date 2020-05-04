if exists('*packager#init')
  call packager#add('junegunn/fzf.vim')
endif

" The directory of fzf must also be in the runtimepath
execute 'set runtimepath+='. $DOTFILES .'/fzf'

" Search Files
nmap <Leader>sf :GFiles<CR>

" Search Buffers
nmap <Leader>sb :Buffers<CR>

" Search Commits
nmap <Leader>sc :Commits<CR>

" To be able to pass options
command! -bang -nargs=* -complete=dir RRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '. <q-args>, 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang H call fzf#vim#helptags(<bang>0)

" vim: ts=2 sw=2 et fdm=marker

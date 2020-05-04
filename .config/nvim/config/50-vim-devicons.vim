if exists('*packager#init')
  call packager#add('ryanoasis/vim-devicons')
endif

" Minor improvement to avoid auto-detection on every start
let g:WebDevIconsOS = 'Linux'

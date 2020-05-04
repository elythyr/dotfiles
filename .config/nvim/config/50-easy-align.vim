if exists('*packager#init')
  call packager#add('junegunn/vim-easy-align')
endif

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim: ts=2 sw=2 et fdm=marker

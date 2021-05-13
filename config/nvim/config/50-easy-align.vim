if exists('*packager#init')
  call packager#add('junegunn/vim-easy-align', {'type': 'opt'})
endif

" Start interactive EasyAlign for a motion/text object (e.g. gaip=)
nmap <silent> ca :packadd vim-easy-align<CR><Plug>(EasyAlign)

" Start interactive EasyAlign in visual mode (e.g. vipga=)
xmap <silent> ca :<C-u>packadd vim-easy-align<CR>:normal! gv<CR><Plug>(EasyAlign)

" vim: ts=2 sw=2 et fdm=marker

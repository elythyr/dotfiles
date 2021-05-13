if exists('*packager#init')
  call packager#add('norcalli/nvim-colorizer.lua', {'type': 'opt'})
endif

nmap <silent> yoC :packadd nvim-colorizer.lua <BAR> :ColorizerToggle<CR>

" vim: ts=2 sw=2 et fdm=marker

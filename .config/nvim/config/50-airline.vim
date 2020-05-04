if exists('*packager#init')
  call packager#add('vim-airline/vim-airline')
  call packager#add('vim-airline/vim-airline-themes')
endif

let g:airline#extensions#tabline#enabled = 1    " Show buffers in a top-bar
let g:airline#extensions#tabline#namemod = ':t' " Show just the filename

if empty(get(g:, 'airline_symbols', {}))
  let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ""

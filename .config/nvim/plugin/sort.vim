function! s:sort(type, ...)
    '[,']sort
endfunction

nmap <silent> <Plug>SortOperator :set opfunc=<SID>sort<CR>g@
nmap gs <Plug>SortOperator

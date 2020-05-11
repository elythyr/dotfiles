if 2 != exists(':CocAction')
  finish
endif

" Auto-commands {{{

  augroup coc_custom
    autocmd!
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')

    " , being my leader it does not trigger the signature helper properly
    " https://github.com/neoclide/coc.nvim/issues/1797#issuecomment-616940358
    autocmd InsertCharPre * if ',' == v:char | call CocActionAsync('showSignatureHelp') | endif

    autocmd FileType * call s:InitBuffer()
  augroup END

  function! s:InitBuffer() abort " {{{
    " Unfortunately we can't call CocHasProvider('definition') here
    " Because the RPC client does not seems to be work yet
    " We would need a User event triggered when CoC is operational for a
    " buffer
    if 'help' != &filetype
      nmap <buffer> <silent> <C-]> :call CocActionAsync('jumpDefinition', 'edit')<CR>
      nmap <buffer> <silent> <C-w><C-]> :call CocActionAsync('jumpDefinition', 'vsplit')<CR>
    endif
  endfunction " }}}

" }}}


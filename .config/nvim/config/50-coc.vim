if exists('*packager#init')
  call packager#add('neoclide/coc.nvim', {'branch': 'release'})
endif

" Extensions {{{

  " Extensions will be installed on start
  " coc-json: Help with CoC configuration file
  " coc-vimlsp: VimL completion <3
  " coc-actions: Floating windows for possible actions
  " coc-snippets: Handle all kinds of snippet
  " coc-ultisnips: Alternative to coc-snippets if it's too much
  let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-vimlsp',
  \ ]

" }}}

" Mappings {{{

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Goto code navigation.
  nmap <silent> <C-M-]> :call CocActionAsync('jumpTypeDefinition', 'edit')<CR>
  nmap <silent> <C-w><C-M-]> :call CocActionAsync('jumpTypeDefinition', 'vsplit')<CR>
  " nmap <silent> gi <Plug>(coc-implementation)
  " nmap <silent> gr <Plug>(coc-references)}

  nmap <silent> gh :call CocActionAsync('doHover')<CR>

  " cr used by tpope/vim-abolish
  " nmap crn <Plug>(coc-rename)
  " Uses this until phpactor provide rename feature in LSP
  nmap <silent> crn :CocCommand document.renameCurrentWord<CR>

  " Multiple cursor mapping, select the word under the cursor and move to the
  " next match
  nmap <expr> <silent> <C-c> "\<Plug>(coc-cursors-word)*:nohl\<CR>"
  " To make it appear like a visual selection
  highlight link CocCursorRange Visual

  " Use <Tab> to expand snippets (may conflict with UltiSnips if enabled)
  " imap <silent> <expr> <Tab> coc#expandable()
  "   \ ? "\<Plug>(coc-snippets-expand)"
  "   \ : "\<Tab>"

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>ac <Plug>(coc-codeaction-selected)
  nmap <leader>ac <Plug>(coc-codeaction-selected)

  " To manually refresh CoC completion list
  inoremap <expr> <silent> <C-space> coc#refresh()

  " Refresh completion list on <BS>
  " Conflicting mapping, see: after/plugin/conflicting-mappings.vim
  " imap <silent> <BS> <BS><C-space>

" }}}

" Status line {{{

  let g:airline#extensions#coc#enabled = 1 " see :h coc-status-airline

" }}}

" vim: fdm=marker

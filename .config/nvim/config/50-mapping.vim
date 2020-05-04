" To toggle from paste mode to non-paste mode
set pastetoggle=<F12>

" Search {{{1
  " To count the number of times the word under the cursor is present in the
  " document
  map ,* *<C-O>:%s///gn<CR>

  " To count the number of results for the last search
  map ,n :%s///gn<CR>

  " Search for selected text, forwards or backwards.
  " http://vim.wikia.com/wiki/Search_for_visually_selected_text
  vnoremap <silent> * :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy/<C-R><C-R>=substitute(
    \substitute(escape(@", '/\.*$^~['), '\v^\_s*(.{-})\_s*$', '\1', ''),
    \'\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>
  vnoremap <silent> # :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy?<C-R><C-R>=substitute(
    \substitute(escape(@", '/\.*$^~['), '\v^\_s*(.{-})\_s*$', '\1', ''),
    \'\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>
" 1}}}

" Buffers {{{1
  " Command mapping (:bq) to close the current buffer and go back to the
  " previous one
  " cmap bq :bp <BAR> :bd #
  cnoreabbrev bq bp <BAR> bd #<CR>

  " <C-^> is a real pain on azerty keaybords...
  nnoremap <C-h> <C-^>

  " Quick access on some of the most used commands
  nnoremap <silent> <Leader>w :w<CR>
  inoremap <silent> <Leader>w <Esc>:w<CR>
  nnoremap <silent> <Leader>x :x<CR>
  inoremap <silent> <Leader>x <Esc>:x<CR>
  nnoremap <silent> <Leader>q :q<CR>
  inoremap <silent> <Leader>q <Esc>:q<CR>
" 1}}}

" Folds {{{1
  " Open all folds and close one level
  " Usefull to open everything but documentation block
  if empty(maparg('zT', 'n'))
    nnoremap <silent> zT zR<BAR>zm<CR>
  endif

  " Reset foldlevel to 1
  if empty(maparg('zI', 'n'))
    if &foldlevelstart < 0
      nnoremap <silent> zI zM<BAR>zr<CR>
    else
      nnoremap <silent> zI :let &foldlevel = &foldlevelstart<CR>
    endif
  endif
" 1}}}

" Terminal {{{1
  tnoremap <silent> <Esc> <C-\><C-n>
" 1}}}

" Fugitive {{{1
  nnoremap <silent> <Leader>gb :Gblame<CR>
  " Open the status window in a new tab
  nnoremap <silent> <Leader>gs :Gtabedit :<CR>
" 1}}}

" Various {{{1
  nnoremap <silent> <Leader>on :on<CR>

  " Quick shell command
  nnoremap ! :!

  nnoremap <silent> <C-l> :noh<CR>
" 1}}}

" Rg {{{1
  nnoremap <silent> <Leader>rg :Rg \b<C-R>=expand('<cword>')<CR>\b<CR>
" 1}}}

" vim: ts=2 sw=2 et fdm=marker

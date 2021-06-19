if exists('*packager#init')
  call packager#add('junegunn/fzf.vim')
endif

" Helpers {{{

" Add a default action to add entries to the quickfix
function! s:buildQuickfixList(lines) abort
  function! s:buildQuickfixItem(line) abort
    let l:matches = matchlist(a:line, '\v^(.{-})%(:(\d+))?%(:(\d+))?%(\s+(.+))?$')

    return {
      \ 'filename': l:matches[1],
      \ 'lnum': l:matches[2],
      \ 'col': l:matches[3],
      \ 'text': l:matches[4],
      \ }
  endfunction

  call setqflist(map(copy(a:lines), { k,v -> s:buildQuickfixItem(v) }))
  copen
  cc
endfunction

" }}}

" Config {{{

" The directory of fzf must also be in the runtimepath
if !filereadable('/usr/share/vim/vimfiles/plugin/fzf.vim')
  " Otherwise use the version in the dotfiles
  execute 'set runtimepath+='. $DOTFILES .'/fzf'
endif

let g:fzf_action = {
  \ 'ctrl-q': function('s:buildQuickfixList'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" To have fzf opening in a new window at the bottom of the screen
" let g:fzf_layout = {'down': '30%'}

" To have fzf opening ina floating window
let g:fzf_layout = {'window': {
  \ 'highlight': 'Comment',
  \ 'width': 0.99,
  \ 'height': 0.95,
  \ 'border': 'sharp',
\ }}

" Hide the status line when not using a floating window
if has('nvim') && type(get(get(g:, 'fzf_layout', {}), 'window', '')) != type({})
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \ | autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

" }}}

" Mappings {{{

nmap <Leader>sf :GFiles<CR>
nmap <Leader>sF :Files<CR>
nmap <Leader>sb :Buffers<CR>
nmap <Leader>sc :Commits<CR>

" }}}

" Commands {{{

" From fzf plugins

" To be able to pass options
command! -bang -nargs=* -complete=dir RRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '. <q-args>, 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang H call fzf#vim#helptags(<bang>0)

" }}}

" Generate commands based on projectionis {{{
" By default projectionist create commands like Econtroller, Ecommand, etc.
" This will create commands like Controller, Command, etc.
" Which will list all the corresponding files with fzf

function! s:create_commands() abort " {{{
  for [command, patterns] in items(projectionist#navigation_commands())
    let command = get(g:, 'fzfProjectionistCmdPrefix', '') .
      \ s:capitalize(s:remove_non_letters(command))

    execute 'command! -buffer -bang' command
      \ ':call s:fzf_projections("'. command .'", <bang>0, '. string(patterns) .')'
  endfor
endfunction " }}}

function! s:capitalize(string, ...) abort " {{{
  let all = !a:0 || a:1

  return substitute(a:string, '\%(^\|_\|-\|\s\)\zs\a', '\u&', all ? 'g' : '')
endfunction " }}}

function! s:remove_non_letters(string) abort " {{{
  return substitute(a:string, '\A', '', 'g')
endfunction " }}}

function! s:fzf_projections(name, bang, variants) " {{{
  let formats = []
  for variant in a:variants
    call add(formats, variant[0] . projectionist#slash() . (variant[1] =~# '\*\*'
          \ ? variant[1] : substitute(variant[1], '\*', '**/*', '')))
  endfor

  let source = []
  for format in formats
    let source += map(projectionist#glob(format), 'fnamemodify(v:val, ":~:.")')
  endfor

  call fzf#run(fzf#wrap('fzf_projectionist_'. a:name, {
    \ 'source': uniq(sort(source)),
  \ }, a:bang))
endfunction " }}}

augroup fzf_projectionist
  autocmd!
  autocmd User ProjectionistActivate call s:create_commands()
augroup END

" }}}

" vim: ts=2 sw=2 et fdm=marker

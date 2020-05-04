set background=dark

let s:colorscheme = 'base-16'

 " base-16 {{{

if 'base-16' == s:colorscheme
  if exists('*packager#init')
    call packager#add('chriskempson/base16-vim')
  endif

  if !has('gui_running') && 0 == &termguicolors
    if !exists('g:base16_shell_path')
      let g:base16_shell_path = $DOTFILES.'/base16/base16-shell/scripts'
    endif

    let base16colorspace = 256
  endif

  colorscheme base16-tomorrow-night
  call Base16hi('Comment', '', '', '', '', 'italic')
endif

" }}}

" vim-one {{{

if 'vim-one' == s:colorscheme
  if exists('*packager#init')
    call packager#add('rakr/vim-one')
  endif

  if !has('nvim')
    set t_8b=[48;2;%lu;%lu;%lum
    set t_8f=[38;2;%lu;%lu;%lum
  endif

  let g:one_allow_italics = 1
  let g:airline_theme='one'

  colorscheme one
endif

" }}}

" space-vim {{{

if 'space-vim' == s:colorscheme
  if exists('*packager#init')
    call packager#add('liuchengxu/space-vim-theme')
  endif

  " Range:   233 (darkest) ~ 238 (lightest)
  " Default: 235
  let g:space_vim_dark_background = 234

  colorscheme space_vim_theme

  hi Comment cterm=italic gui=italic
  " hi Normal ctermbg=NONE guibg=NONE
  " hi LineNr ctermbg=NONE guibg=NONE
  " hi SignColumn ctermbg=NONE guibg=NONE
endif

" }}}

" onehalf {{{

if 'onehalf' == s:colorscheme
  if exists('*packager#init')
    call packager#add('sonph/onehalf', {'rtp': 'vim/'})
  endif

  if has('gui_running') || 1 == &termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif

  let g:airline_theme='onehalfdark'
  colorscheme onehalfdark

  hi Comment cterm=italic gui=italic
  " hi Normal ctermbg=NONE guibg=NONE
  " hi LineNr ctermbg=NONE guibg=NONE
  " hi SignColumn ctermbg=NONE guibg=NONE
endif

" }}}

" jellybeans {{{

if 'jellybeans' == s:colorscheme
  if exists('*packager#init')
    call packager#add('nanotech/jellybeans.vim')
  endif

  " Class background instead of pure black
  let g:jellybeans_overrides = {
    \ 'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
  \}
  if has('termguicolors') && &termguicolors
      let g:jellybeans_overrides['background']['guibg'] = 'none'
  endif

  let g:jellybeans_use_term_italics = 1
  let g:airline_theme='jellybeans'

  colorscheme jellybeans
endif

" }}}

" vim: fdm=marker

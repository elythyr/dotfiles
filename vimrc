let s:vimrc = fnamemodify('~/.config/nvim/init.vim', ':p')

if filereadable(s:vimrc)
  execute 'source' s:vimrc
endif

unlet s:vimrc

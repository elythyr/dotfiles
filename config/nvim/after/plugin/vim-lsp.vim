if 2 != exists(':LspStatus')
  finish
endif

if executable('phpactor')
  " TODO: add config for that
  " \ 'cmd': {server_info->['phpactor', 'language-server', '--record=/tmp/lsp.log']},
  au User lsp_setup call lsp#register_server({
        \ 'name': 'phpactor',
        \ 'cmd': {server_info->['phpactor', 'language-server']},
        \ 'whitelist': ['php','cucumber'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

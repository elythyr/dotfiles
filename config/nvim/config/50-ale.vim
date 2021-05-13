if exists('*packager#init')
  call packager#add('w0rp/ale')
endif

let g:airline#extensions#ale#enabled = 1
let g:ale_yaml_yamllint_options = '-d relaxed'
let g:ale_fixers = { 'php': [
  \ 'php_cs_fixer',
  \ 'remove_trailing_lines',
  \ 'trim_whitespace',
\ ]}
let g:ale_php_cs_fixer_options = '--using-cache=no --quiet --no-interaction'

nmap <silent> <Leader>fs <Plug>(ale_fix)<CR>

" vim: ts=2 sw=2 et fdm=marker

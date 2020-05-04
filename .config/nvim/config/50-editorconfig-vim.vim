if exists('*packager#init')
  call packager#add('editorconfig/editorconfig-vim', { 'type': 'opt' })
endif

let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']

" vim: et ts=2 sw=2 fdm=marker

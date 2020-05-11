" Enable NCM2 for all buffers

if 2 != exists('##User Ncm2Plugin')
  finish
endif

augroup ncm2_custom_enable
  autocmd!
  autocmd BufEnter * call ncm2#enable_for_buffer()
augroup END

" vim: et ts=2 sw=2 fdm=marker

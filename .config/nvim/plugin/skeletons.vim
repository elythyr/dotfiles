if exists('g:loaded_skeletons')
  finish
endif

let g:loaded_skeletons = v:true
if !exists('g:skeletons_dir')
  let g:skeletons_dir = fnamemodify(resolve(expand('<sfile>')), ':p:h:h') .'/skeletons'
endif

function! s:applySkeleton(filename)
  let l:extension = fnamemodify(a:filename, ':e')

  if empty(l:extension)
    return
  endif

  let l:skeletonFilename = glob(g:skeletons_dir.'/*.'.l:extension)

  if empty(l:skeletonFilename)
    return
  endif

  execute '0r' l:skeletonFilename
endfunction

augroup ElySkeletons
  autocmd!
  autocmd BufNewFile * call <SID>applySkeleton(expand('%'))
augroup END

" vim: ts=2 sw=2 et fdm=marker

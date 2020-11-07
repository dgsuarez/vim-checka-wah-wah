" Vim plugin for checkbox management
" Author: Diego Guerra <https://github.com/dgsuarez>
" License: www.opensource.org/licenses/bsd-license.php

augroup checka_wah_wah_autocommands
  autocmd!
  autocmd FileType markdown nnoremap <silent> <Space> :silent call <SID>ToggleCheckbox('.')<CR>
  autocmd FileType markdown vnoremap <silent> <Space> :<C-U>silent call <SID>ToggleCheckbox("'<,'>")<CR>
  autocmd FileType markdown nnoremap <silent> <C-Space> :silent call <SID>FullToggleCheckbox('.')<CR>
  autocmd FileType markdown vnoremap <silent> <C-Space> :<C-U>silent call <SID>FullToggleCheckbox("'<,'>")<CR>
augroup END

function! s:ToggleCheckbox(operateOn)
  let noCheckbox = ' \ze[^\[\b]'
  let uncheckedCheckbox = '\[\s*\]'
  let checkedCheckbox = '\[[^\s]\]'

  if s:TryReplaceCheckbox(a:operateOn, noCheckbox, ' [ ] ') | return
  elseif s:TryReplaceCheckbox(a:operateOn, uncheckedCheckbox, ' [x]') | return
  elseif s:TryReplaceCheckbox(a:operateOn, checkedCheckbox, ' [ ]') | return
  endif
endfunction

function! s:FullToggleCheckbox(operateOn)
  let checkbox = '\[.\?\]'
  let noCheckbox = ' \ze[^\[\b]'

  if s:TryReplaceCheckbox(a:operateOn, noCheckbox, ' [ ] ') | return
  elseif s:TryReplaceCheckbox(a:operateOn, checkbox, '') | return
  endif
endfunction

function! s:TryReplaceCheckbox(operateOn, search, replace)
  let listStart = '^\(\s*[-\*]\)\s*'

  try
    execute a:operateOn . 's/' . listStart . a:search . '/\1' . a:replace . '/'
    return 1
  catch
    return 0
  endtry
endfunction


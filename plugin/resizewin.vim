"=============================================================================
" File: resizewin.vim
" Author: t9md <taqumd@gmail.com>
" Version: 1.0
" WebPage: http://github.com/t9md/resizewin.vim
" License: BSD
" Usage:
"   What is this?
"   ==================================
"   resizewin.vim is minimal utility for resize win

    " * horizontally
    " * vertically
    " * full(both horizontally and vertically)

"   KeyMap Example
"   ================================
"   following keymap overwrite 'V'(which originally used as linewise-visual)
"   but I set linewise-visual to 'L'.
"   so for me I can use 'V' freely.

      " vmap H <Plug>(ResizeH)
      " vmap V <Plug>(ResizeV)
      " vmap F <Plug>(ResizeHV)
      " nmap H <Plug>(ResizeH)
      " nmap V <Plug>(ResizeV)
      " nmap F <Plug>(ResizeHV)

"   Command
"   ===================================================
"   #### ResizeH
"   resize horizontally

"   #### ResizeV
"   resize vertically

"   #### ResizeHV
"   resize horizontally and vertically

let s:old_cpo = &cpo
set cpo&vim

unlet! s:restore_cmd

function! ResizeWin(resize_cmd)
    if exists('s:restore_cmd')
        try
            " echo s:restore_cmd
            execute s:restore_cmd
        finally
            unlet! s:restore_cmd
        endtry
    else
        let s:restore_cmd = winrestcmd()
        execute a:resize_cmd
    endif
endfunction

command! ResizeH  :call ResizeWin('resize')
command! ResizeV  :call ResizeWin('vertical resize')
command! ResizeHV :call ResizeWin('resize | vertical resize')

nnoremap <silent> <Plug>(ResizeH)  :ResizeH<CR>
nnoremap <silent> <Plug>(ResizeV)  :ResizeV<CR>
nnoremap <silent> <Plug>(ResizeHV) :ResizeHV<CR>

vnoremap <silent> <Plug>(ResizeH)  :<C-u>ResizeH<CR>
vnoremap <silent> <Plug>(ResizeV)  :<C-u>ResizeV<CR>
vnoremap <silent> <Plug>(ResizeHV) :<C-u>ResizeHV<CR>

"reset &cpo back to users setting
let &cpo = s:old_cpo

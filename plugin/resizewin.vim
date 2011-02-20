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
"
"		    vmap _     <Plug>(ResizeWinH)
"		    vmap <bar> <Plug>(ResizeWinV)
"		    vmap F     <Plug>(ResizeWinHV)
"		    nmap _     <Plug>(ResizeWinH)
"		    nmap <bar> <Plug>(ResizeWinV)
"		    nmap F     <Plug>(ResizeWinHV)
"
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

command! ResizeWinH  :call ResizeWin('resize')
command! ResizeWinV  :call ResizeWin('vertical resize')
command! ResizeWinHV :call ResizeWin('resize | vertical resize')

nnoremap <silent> <Plug>(ResizeWinH)  :ResizeWinH<CR>
nnoremap <silent> <Plug>(ResizeWinV)  :ResizeWinV<CR>
nnoremap <silent> <Plug>(ResizeWinHV) :ResizeWinHV<CR>

vnoremap <silent> <Plug>(ResizeWinH)  :<C-u>ResizeWinH<CR>
vnoremap <silent> <Plug>(ResizeWinV)  :<C-u>ResizeWinV<CR>
vnoremap <silent> <Plug>(ResizeWinHV) :<C-u>ResizeWinHV<CR>

"reset &cpo back to users setting
let &cpo = s:old_cpo

"=============================================================================
" File: resizewin.vim
" Author: t9md <taqumd@gmail.com>
" Version: 0.2
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

command! ResizeWinMaxH  :call ResizeWin('resize')
command! ResizeWinMaxV  :call ResizeWin('vertical resize')
command! ResizeWinMaxHV :call ResizeWin('resize | vertical resize')

command! ResizeWinMinH  :call ResizeWin('resize 0')
command! ResizeWinMinV  :call ResizeWin('vertical resize 0')
command! ResizeWinMinHV :call ResizeWin('resize 0 | vertical resize 0')

nnoremap <silent> <Plug>(ResizeWinMaxH)  :ResizeWinMaxH<CR>
nnoremap <silent> <Plug>(ResizeWinMaxV)  :ResizeWinMaxV<CR>
nnoremap <silent> <Plug>(ResizeWinMaxHV) :ResizeWinMaxHV<CR>

vnoremap <silent> <Plug>(ResizeWinMaxH)  :<C-u>ResizeWinMaxH<CR>
vnoremap <silent> <Plug>(ResizeWinMaxV)  :<C-u>ResizeWinMaxV<CR>
vnoremap <silent> <Plug>(ResizeWinMaxHV) :<C-u>ResizeWinMaxHV<CR>

nnoremap <silent> <Plug>(ResizeWinMinH)  :ResizeWinMinH<CR>
nnoremap <silent> <Plug>(ResizeWinMinV)  :ResizeWinMinV<CR>
nnoremap <silent> <Plug>(ResizeWinMinHV) :ResizeWinMinHV<CR>

vnoremap <silent> <Plug>(ResizeWinMinH)  :<C-u>ResizeWinMinH<CR>
vnoremap <silent> <Plug>(ResizeWinMinV)  :<C-u>ResizeWinMinV<CR>
vnoremap <silent> <Plug>(ResizeWinMinHV) :<C-u>ResizeWinMinHV<CR>



"reset &cpo back to users setting
let &cpo = s:old_cpo

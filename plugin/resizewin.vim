"=============================================================================
" File: resizewin.vim
" Author: t9md <taqumd@gmail.com>
" Version: 0.2
" WebPage: https://github.com/t9md/vim-resizewin
" License: BSD

" GUARD: {{{1
"============================================================
if exists('g:loaded_resizewin')
  finish
endif

let g:loaded_resizewin = 1
let s:old_cpo = &cpo
set cpo&vim

" MAIN: {{{1
"============================================================
unlet! s:restore_cmd

function! ResizeWin(resize_cmd)
    if exists('s:restore_cmd')
        try
            execute s:restore_cmd
        finally
            unlet! s:restore_cmd
        endtry
    else
        let s:restore_cmd = winrestcmd()
        execute a:resize_cmd
    endif
endfunction

" COMMAND: {{{1
"============================================================
command! ResizeWinMaxH  :call ResizeWin('resize')
command! ResizeWinMaxV  :call ResizeWin('vertical resize')
command! ResizeWinMaxHV :call ResizeWin('resize | vertical resize')

command! ResizeWinMinH  :call ResizeWin('resize 0')
command! ResizeWinMinV  :call ResizeWin('vertical resize 0')
command! ResizeWinMinHV :call ResizeWin('resize 0 | vertical resize 0')

" VERTUAL KEYMAP: {{{1
"============================================================
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

" FIN: {{{1
"============================================================
let &cpo = s:old_cpo

" vim: set sw=4 sts=4 et fdm=marker fdc=3 fdl=3:

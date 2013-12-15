let s:resizewin = {}

function! s:resizewin.resize(ward) "{{{1
  let varname = "w:" . "resizewin_resetcmd"
  let {varname} =  winrestcmd()
  let v = a:ward ==# 'v' ? 'vertical ' : ''
  exe v . "resize"
  call s:msg("Resized", "Statement")
endfunction

function! s:resizewin.restore(ward) "{{{1
  let varname = "w:" . "resizewin_resetcmd"
  if exists(varname)
    exe w:resizewin_resetcmd
  endif
  unlet w:resizewin_resetcmd
  call s:msg("Restored", "PreProc" )
endfunction

function! s:resizewin.toggle(ward) "{{{1
  let varname = "w:" . "resizewin_resetcmd"
  if exists(varname)
    call self.restore(a:ward)
  else
    call self.resize(a:ward)
  endif
endfunction

function! s:msg(msg, ...) "{{{1
	echohl Type
	echon 'resizewin: '

  let color = a:0 ? a:1 : "Normal"
	exec "echohl"  color
  echon a:msg
	echohl None
endfunction

function! s:resizewin.reset() "{{{1
  " if has_key(self, "_winrestcmd")
    " call remove(self, "_winrestcmd")
  " endif
endfunction

function! s:resizewin.debug() "{{{1
  echo PP( self )
endfunction

function! resizewin#toggle(ward) "{{{1
  call s:resizewin.toggle(a:ward)
endfunction

function! resizewin#reset() "{{{1
  call s:resizewin.reset()
endfunction

function! resizewin#debug() "{{{1
  call s:resizewin.debug()
endfunction
" vim: foldmethod=marker

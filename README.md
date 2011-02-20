What is this?
==================================
resizewin.vim is minimal utility for resize win

  * horizontally
  * vertically
  * full(both horizontally and vertically)

KeyMap Example
================================
following keymap overwrite 'V'(which originally used as linewise-visual)
but I set linewise-visual to 'L'.
so for me I can use 'V' freely.

    vmap H <Plug>(ResizeH)
    vmap V <Plug>(ResizeV)
    vmap F <Plug>(ResizeHV)
    nmap H <Plug>(ResizeH)
    nmap V <Plug>(ResizeV)
    nmap F <Plug>(ResizeHV)

Command
===================================================
#### ResizeH
resize horizontally

#### ResizeV
resize vertically

#### ResizeHV
resize horizontally and vertically

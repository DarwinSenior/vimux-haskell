command! GhciLoadFile :call vimuxhaskell#GhciLoadFile()
command! GhciRunCommand :call vimuxhaskell#GhciRunCommand()
command! GhciOpen :call vimuxhaskell#GhciOpen()
command! GhciClose :call vimuxhaskell#GhciClose()
command! GhciInterrupt :call vimuxhaskell#GhciInterrupt()


call operator#user#define('sendghci', 'vimuxhaskell#GhciSendTextObject')

if !exists("g:vimux_haskell_default_mapping")
    let g:vimux_haskell_default_mapping = 0
endif


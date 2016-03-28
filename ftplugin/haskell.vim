if !g:vimux_haskell_default_mapping
    finish
endif

nmap <Leader>ho :GhciOpen<Enter>
nmap <Leader>hx :GhciClose<Enter>
nmap <Leader>hi :GhciInterrupt<Enter>
nmap <Leader>hl :GhciLoadFile<Enter>
nmap <Leader>hr :GhciRunCommand<Enter>
nmap <Leader>hr :GhciRunCommand<Enter>

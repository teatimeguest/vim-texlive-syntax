augroup texlive
  autocmd!
  autocmd BufNewFile,BufRead texlive.profile,*.texlive.profile
    \ setlocal filetype=texlive_profile
  autocmd BufNewFile,BufRead installation.profile setfiletype texlive_profile
  autocmd BufNewFile,BufRead DEPENDS.txt setlocal filetype=depends_txt
augroup END

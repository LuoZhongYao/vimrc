augroup templates
    au!
    " read  in template files
    " autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/templates/skeleton.'. expand("<afile>:e")
    autocmd BufNewFile *.* call Template()
    " parse special text in the templates after the read
    " autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
    " autocmd BufWritePre,FileWritePre * ks|call LastMod()|'s

    fun Template()
        silent! execute '0r $HOME/.vim/templates/skeleton.' . expand("<afile>:e")
        if line("$") > 20
            let l = 20
        else
            let l = line("$")
        endif
        silent! execute '1,' . l . 's/\[:BASE:\]_\[:EXPAND:\]/\=substitute(expand("%:t"),"\\(.*\\)\\.\\(.*\\)","\\U\\1_\\2","")'
        silent! execute '1,' . l . 'g/Modified: /s/\(Modified: \).*/\1' . strftime('%Y\/%m\/%d')
    endfunc

    "fun LastMod()
    "    if line("$") > 20
    "        let l = 20
    "    else
    "        let l = line("$")
    "    endif
    "    silent! execute "1," . l . "g/Modified: /s/Modified: .*/Modified: " . strftime("%Y %b %d")
    "endfunction
augroup END

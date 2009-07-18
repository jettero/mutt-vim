" my mutt aliases complete function(s)
" 
" To install this, add it to ~/.vim/scripts/ or somewhere
" and add something like the following:
"
"   au BufRead /tmp/mutt-* source ~/.vim/scripts/mutt-aliases.vim
"   au BufRead ./example.file source ./mutt-aliases.vim
"
" Invoke the completion in insert mode with either i_CTRL-X_CTRL-U, or with
" macro: imap macro: @@ inserted by this .vim script.

let s:address_dictionary = {}

fun! Read_Aliases()
    let lines = readfile(expand("~/.aliases"))
    for line in lines
        if line =~ "^[ ]*alias "
            let tokens  = split(line)
            let alias   = tokens[1]
            let address = join(tokens[2:])

            let s:address_dictionary[alias] = address
        endif
    endfor
endfun

fun! Complete_Emails(findstart, base)
    if a:findstart
        let line = getline('.')
        let start = col('.') - 1

        while start > 0 && line[start - 1] =~ '\a'
            let start -= 1
        endwhile

        echo "start: " start

        return start

    else
        let res = []

        for alias in keys(s:address_dictionary)
            if alias =~ '^' . a:base
                call add(res, s:address_dictionary[alias])
            endif
        endfor

        for address in values(s:address_dictionary)
            if address =~ a:base
                call add(res, address)
            endif
        endfor

        return res
    endif
endfun

call Read_Aliases()
set completefunc=Complete_Emails
imap @@ <C-X><C-U>


" my mutt aliases omni

let address_dictionary = {}

fun! read_aliases()
    let lines = readfile("~/.aliases")
    for line in lines
        echo line
    endfor
endfun

fun! complete_emails(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1

        while start > 0 && line[start - 1] =~ '\a'
            let start -= 1
        endwhile

        return start

    else
        " find months matching with "a:base"
        let res = []

        for m in split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec")
            if m =~ '^' . a:base
                call add(res, m)
            endif
        endfor

        return res
    endif
endfun

call read_aliases()
set completefunc=complete_emails

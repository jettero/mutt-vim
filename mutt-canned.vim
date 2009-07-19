" my mutt canned response function(s)
" 
" To install this, add it to ~/.vim/scripts/ or somewhere
" and add something like the following:
"
"   au BufRead /tmp/mutt-* source ~/.vim/scripts/mutt-canned.vim
"   au BufRead ./example.file source ./mutt-canned.vim
"
" 0) echo lol, canned response > ~/.canned/lol
" 1) hammer CTRL-X (twice or more) to hop through them
"
" Author: Paul Miller <jettero@cpan.org>
" Copyright: Paul Miller
" License: Public Domain
" Repository: http://github.com/jettero/mutt-vim/
" Issue Tracking: http://github.com/jettero/mutt-vim/issues
"

let canned = split(glob("~/.canned/*"), "\n")
if len(canned)
    for file in canned
        let ftok = split(file, "/")
        let bnam = substitute(ftok[-1], '\s', '_', 'g')

        exec  "menu Canned." . bnam . " :r " . file . ""
        exec "vmenu Canned." . bnam . " dk:emenu Canned." . bnam . ""
    endfor
endif

set wildmenu
set cpo-=<
set wcm=<C-X>

map <C-X><C-X> :emenu Canned.<C-X>

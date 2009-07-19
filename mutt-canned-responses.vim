" my canned response gizmo
"  [18:10] jettero: I'm looking for a way to implement a canned response system for vim (and mutt indirectly), I don't see 
"                   anything like it on vim.org ... if I'm writing it, I'm looking for help pages concerning text based (I don't 
"                   use the gui) menu systems vim might have...
"  [18:11] jettero: I know there's the popups for completetions and things, but I don't think you can write your own really... 
"                   and I recall seeing one available from : somehow...
"  [18:16] mgedmin: well...
"  [18:16] mgedmin: you can use :echo and, um, I forgot the name of the function to read input
"  [18:16] mgedmin: to get a "menu" of the kind that, say, the spell checker's suggestions use
"  [18:16] mgedmin: or :tsel
"  [18:17] mgedmin: :echo and input()
"  [18:17] navi_sir (n=navi@dhcp-077-250-192-179.chello.nl) has left #vim ()
"  [18:17] mgedmin: GUI has real menus, of course
"  [18:18] mgedmin: and console has something like that (:help console-menus), but I've never used them
"  [18:18] mgedmin: I don't know if omni-completion-style popups can be used from vimscript
"  [18:19] factor_ (n=factor@ip70-189-85-196.ok.ok.cox.net) has joined #vim
"  
"  

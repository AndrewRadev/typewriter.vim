if exists('g:loaded_typewriter') || &cp
  finish
endif

let g:loaded_typewriter = '0.1.0' " version number
let s:keepcpo = &cpo
set cpo&vim

if !exists('g:typewriter_throttle')
  let g:typewriter_throttle = 6
endif

if !exists('g:typewriter_enabled')
  let g:typewriter_enabled = v:false
endif

command! TypewriterEnable  call typewriter#Enable()
command! TypewriterDisable call typewriter#Disable()
command! TypewriterToggle  call typewriter#Toggle()

if g:typewriter_enabled
  call typewriter#Enable()
endif

let &cpo = s:keepcpo
unlet s:keepcpo

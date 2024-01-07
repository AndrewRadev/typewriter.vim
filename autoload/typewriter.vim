let s:typewriter_enabled = v:false
let s:sound_dir = expand('<sfile>:p:h') .. '/../sounds'

let s:playing_clicks = {}

let s:clicks = [
      \   s:sound_dir .. '/click1.wav',
      \   s:sound_dir .. '/click2.wav',
      \   s:sound_dir .. '/click3.wav',
      \ ]
let s:carriage = s:sound_dir .. '/carriage1.wav'
let s:ding     = s:sound_dir .. '/ding1.wav'

function! typewriter#Enable() abort
  if !has('sound')
    echohl WarningMsg
    echo "Typewriter.vim requires a Vim compiled with +sound"
    echohl NONE
    return
  endif

  let s:typewriter_enabled = v:true

  augroup Typewriter
    autocmd!
    autocmd TextChangedI,TextChangedP * call s:Click()
    autocmd InsertEnter * call sound_playfile(s:carriage)
    autocmd InsertLeave * call sound_playfile(s:ding)
  augroup END
endfunction

function! typewriter#Disable() abort
  let s:typewriter_enabled = v:false

  augroup Typewriter
    autocmd!
  augroup END
endfunction

function! typewriter#Toggle() abort
  if s:typewriter_enabled
    call typewriter#Disable()
  else
    call typewriter#Enable()
  endif
endfunction

function! s:Click() abort
  if g:typewriter_throttle > 0 && len(keys(s:playing_clicks)) >= g:typewriter_throttle
    return
  endif

  let sound_file = s:clicks[rand() % len(s:clicks)]
  let sound_id = sound_playfile(sound_file, { id, _ -> remove(s:playing_clicks, id) })
  let s:playing_clicks[sound_id] = 1
endfunction

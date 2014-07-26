colors jammy

" Settings"{{{
set ch=2
set lines=30
set columns=100
" Don't show a mouse when typing
set mousehide
set mouse=a
"set gfn=Lucida\ Sans\ Typewriter\ Ultra-Light\ 11
set gfn=Bitstream\ Vera\ Sans\ Mono\ Bold\ 11
if has("balloon_eval")
  set balloonexpr=FoldBalloon()
  set ballooneval
endif
"}}}

" Mappings"{{{
" Make shift-insert work like in Xterm
" In Normal, Visual and Operator-pending mode
map <S-Insert> <MiddleMouse>
" In Insert and Command-Line-Mode
map! <S-Insert> <MiddleMouse>"}}}

" Functions"{{{
function! FoldBalloon()
  let foldStart = foldclosed(v:beval_lnum)
  let foldEnd   = foldclosedend(v:beval_lnum)
  let lines = []
  if foldStart >= 0
      let numLines = foldEnd - foldStart + 1
      if ( numLines > 31 )
          let lines = getline(foldStart, foldStart + 14)
          let lines += [ '-- Snipped ' . (numLines - 30) . ' lines --' ]
          let lines += getline(foldEnd - 14, foldEnd)
      else
          let lines = getline(foldStart, foldEnd)
      endif
  endif
  return join(lines, has("balloon_multiline") ? "\n" : " ")
endfunction"}}}

function! modesearch#highlight#repaint() abort
  let cmdline = getcmdline()
  if cmdline ==# ''
    return
  endif
  let regex = modesearch#_query_string(cmdline)
  try " 有効な正規表現でない可能性がある
    let w:modesearch_match_id = matchadd('IncSearch', regex)
  " catch /^Vim\%((\a\+)\)\=:E5500/
  catch
  endtry
  redraw
endfunction

function! modesearch#highlight#clear() abort
  if exists("w:modesearch_match_id")
    call matchdelete(w:modesearch_match_id)
    unlet w:modesearch_match_id
  endif
endfunction

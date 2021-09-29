let g:modesearch#is_prompt_active = v:false
let s:search_mode = 'rawstr'

function! modesearch#prompt(is_forward, mode = '') abort
  let g:modesearch#is_prompt_active = v:true
  let text = s:prompt(a:mode)
  let g:modesearch#is_prompt_active = v:false
  " cancel
  if text is# "\<Nul>"
    return
  endif
  let search_cmd = a:is_forward ? '/' : '?'
  " 再検索
  if text is# ""
    return search_cmd .. "\<CR>"
  endif
  return search_cmd .. modesearch#_query_string(text) .. "\<CR>"
endfunction

function! modesearch#_query_string(cmdline) abort
  if s:search_mode ==# 'regexp'
    return '\v' .. escape(a:cmdline, '/')
  else
    return '\V' .. escape(a:cmdline, '/\')
  endif
endfunction

function! s:prompt(mode = '') abort
  if a:mode isnot# ''
    let s:search_mode = a:mode
  endif
  let current_mode = s:search_mode
  " TODO: キャンセルと空文字列を区別するより良い方法がないか？
  let text = input({'prompt': '[' .. s:search_mode .. ']/', 'cancelreturn': "\<Nul>" })
  " 中で s:search_mode が変わったらもう一度 prompt を出す
  while s:search_mode !=# current_mode
    let current_mode = s:search_mode
    let text = input({'prompt': '[' .. s:search_mode .. ']/', 'cancelreturn': "\<Nul>", 'default': text})
  endwhile
  return text
endfunction

function! modesearch#toggle() abort
  if g:modesearch#is_prompt_active
    let s:search_mode = s:search_mode ==# 'rawstr' ? 'regexp' : 'rawstr'
    return "\<CR>"
  endif
  return ''
endfunction

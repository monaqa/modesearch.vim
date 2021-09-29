if exists('g:loaded_modesearch') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

nnoremap <expr> <Plug>(modesearch-slash) modesearch#prompt(v:true)
nnoremap <expr> <Plug>(modesearch-slash-rawstr) modesearch#prompt(v:true, "rawstr")
nnoremap <expr> <Plug>(modesearch-slash-regexp) modesearch#prompt(v:true, "regexp")
nnoremap <expr> <Plug>(modesearch-question) modesearch#prompt(v:false)
nnoremap <expr> <Plug>(modesearch-question-rawstr) modesearch#prompt(v:false, "rawstr")
nnoremap <expr> <Plug>(modesearch-question-regexp) modesearch#prompt(v:false, "regexp")
cnoremap <expr> <Plug>(modesearch-toggle-mode) modesearch#toggle()

augroup modesearch
  autocmd CmdlineLeave * call modesearch#highlight#clear()
  autocmd CmdlineChanged @ if g:modesearch#is_prompt_active
  autocmd CmdlineChanged @   call modesearch#highlight#clear()
  autocmd CmdlineChanged @   call modesearch#highlight#repaint()
  autocmd CmdlineChanged @ endif
augroup END

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_modesearch = 1

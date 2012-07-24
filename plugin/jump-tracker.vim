
set cursorline
set cursorcolumn

let g:last_line_position = 0

autocmd  InsertEnter  *  highlight  CursorLine    guifg=NONE  guibg=NONE  ctermfg=NONE  ctermbg=236
autocmd  InsertEnter  *  highlight  CursorColumn  guifg=NONE  guibg=NONE  ctermfg=NONE  ctermbg=NONE
autocmd  InsertLeave  *  highlight  CursorLine    guifg=NONE  guibg=NONE  ctermfg=NONE  ctermbg=NONE

function! s:HighlightHorizontal()
  highlight CursorLine guifg=NONE guibg=NONE ctermfg=NONE ctermbg=4F2F4F
endfunction

function! s:HighlightVertical()
  highlight CursorColumn guifg=NONE guibg=NONE ctermfg=NONE ctermbg=4F2F4F
endfunction

function! s:UnHighlightHorizontal()
  highlight CursorLine guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
endfunction

function! s:UnHighlightVertical()
  highlight CursorColumn guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
endfunction

function! s:CursorMove()
  let cursor_line_position   = winline()
  let cursor_column_position = wincol()

  if g:last_line_position == 0
    call s:HighlightHorizontal()
    call s:HighlightVertical()
    let g:last_line_position   = cursor_line_position
    let g:last_column_position = cursor_column_position
    return
  endif
  
  let line_diff = abs(g:last_line_position - cursor_line_position)
  if line_diff > 1
    call s:HighlightHorizontal()
  else
    call s:UnHighlightHorizontal()
  endif

  let column_line_diff = abs(g:last_column_position - cursor_column_position)
  if column_line_diff > 1
    call s:HighlightVertical()
  else
    call s:UnHighlightVertical()
  endif

  let g:last_line_position   = cursor_line_position
  let g:last_column_position = cursor_column_position
endfunction

autocmd CursorMoved * call s:CursorMove()


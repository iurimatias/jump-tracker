
set cursorline
set cursorcolumn

let g:last_line_position = 0

if !exists('g:jump_insert_mode_color')
  let g:jump_insert_mode_color  = 236
endif
if !exists('g:jump_line_color')
  let g:jump_line_color         = "4F2F4F"
endif
if !exists('g:jump_insert_mode_line')
  let g:jump_insert_mode_line   = 1
endif

if g:jump_insert_mode_line
  autocmd  InsertEnter  *  execute 'highlight  CursorLine    guifg=NONE  guibg=NONE  ctermfg=NONE  ctermbg='.g:jump_insert_mode_color
  autocmd  InsertLeave  *  highlight  CursorLine    guifg=NONE  guibg=NONE  ctermfg=NONE  ctermbg=NONE
end

autocmd  InsertEnter  *  highlight  CursorColumn  guifg=NONE  guibg=NONE  ctermfg=NONE  ctermbg=NONE

function! s:HighlightHorizontal()
  execute 'highlight CursorLine guifg=NONE guibg=NONE ctermfg=NONE ctermbg='.g:jump_line_color
endfunction

function! s:HighlightVertical()
  execute 'highlight CursorColumn guifg=NONE guibg=NONE ctermfg=NONE ctermbg='.g:jump_line_color
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


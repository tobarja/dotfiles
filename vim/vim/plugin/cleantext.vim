" ------- Cleaning stuff ---------
function! <SID>Flake8()
  set lazyredraw
  " Close any existing cwindows.
  cclose
  let l:grepformat_save = &grepformat
  let l:grepprogram_save = &grepprg
  set grepformat&vim
  let &grepformat = '%f:%l:%m'
  let &grepprg = 'flake8'
  if &readonly == 0 | update | endif
  silent! grep! %
  let &grepformat = l:grepformat_save
  let &grepprg = l:grepprogram_save
  let l:mod_total = 0
  let l:win_count = 1
  " Determine correct window height
  windo let l:win_count = l:win_count + 1
  if l:win_count <= 2 | let l:win_count = 4 | endif
  windo let l:mod_total = l:mod_total + winheight(0)/l:win_count |
        \ execute 'resize +'.l:mod_total
  " Open cwindow
  execute 'belowright copen '.l:mod_total
  nnoremap <buffer> <silent> c :cclose<CR>
  set nolazyredraw
  redraw!
endfunction


" Function: CleanText
function! CleanText()
    " Remove trailing spaces
    let curcol = col(".")
    let curline = line(".")
    exe ":retab"
    exe ":%s/ \\+$//e"
    " add spaces to {% var %} and {{ var  }} in the templates if missing
    " silent will hide the press-Enter
    " ge will hide the Not Found errors raised
    silent :%s/[^ ]\zs\ze[}%]}/ /ge
    silent :%s/{[%{]\zs\ze[^ ]/ /ge
    " Put 2 empty lines before a class (take the decorators into account)
    silent :%s/\(@\w*\)\@<!\n*\(\(\n@\w*\)*\n\(class\|def\) \)\@=/\r\r/ge
    " Put spaces between == if there aren't
    silent :%s/\(\S\)\@===\(\S\)\@=/ == /ge
    " Put a space after a coma if missing
    "silent :%s/,\(\S\)\@=/, /ge
    " Remove unwanted spaces after ( or before )
    silent :%s/( /(/ge
    silent :%s/ )/)/ge  " you can do better ...
    set nolazyredraw
    call cursor(curline, curcol)
"   Disabled because I already have a lint plugin
"    if &filetype == 'python'
"        " if the current file is in python, we launch flake8
"        call <SID>Flake8()
"    endif
endfun
" ------- end Cleaning stuff ---------

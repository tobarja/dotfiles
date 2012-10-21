au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au BufNewFile,BufRead *.py compiler nose

" Execute file being edited with F5:
map <buffer> <C-[>OT <Esc>:w<CR>:!/usr/bin/env python % <CR>

" Run nosetests on the current .py file
map <buffer> <C-[>OU :new <Bar>:set buftype=nofile<Bar>set bufhidden=hide<Bar> r ! nosetests #<CR><CR>

set foldmethod=indent

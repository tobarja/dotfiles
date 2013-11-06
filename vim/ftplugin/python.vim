au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au BufNewFile,BufRead *.py compiler nose

" Run nosetests on the current .py file
map <buffer> <C-[>OU :new <Bar>:set buftype=nofile<Bar>set bufhidden=hide<Bar> r ! nosetests #<CR><CR>

set foldmethod=indent
set nofoldenable

set colorcolumn=79

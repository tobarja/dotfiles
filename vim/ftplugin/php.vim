au FileType php setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType html setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

let g:PHP_default_indenting = 2
let g:PHP_outdentphpescape = 0
noremap <F3> <Esc>:set ft=html<CR>gg=G'':set ft=php<CR>gg=G''

" edit files on the same dir
nmap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" python2
let g:python_host_prog='/usr/bin/python2'

" python3
let g:python3_host_prog='/usr/bin/python3'
" coc explorer
" silent! nmap <C-n> :CocCommand explorer<CR>

" cursorhold
let g:cursorhold_updatetime = 100

" pear tree
" let g:pear_tree_repeatable_expand = 0
" indentline
" let g:indentLine_char       = '▏'
" let g:indentLine_setConceal = 1

" script indent in html
" let g:html_indent_script1 = "inc"
" let g:html_indent_style1 = "inc"

" tab
nmap <silent> <C-t> :tabnew<CR>
nmap <silent> <C-h> :tabprev<CR>
nmap <silent> <C-l> :tabnext<CR>

" autocmd BufEnter *.pug set filetype=slim

" FZF
" exclude modules,vendor,etc
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" silent! nmap <C-p> :GFiles --exclude-standard --others --cached<CR>
silent! nmap <C-p> :FZF<CR>

" Persist cursor
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" PHP Documenter
" au BufRead,BufNewFile *.php inoremap <buffer> <C-B> :call PhpDoc()<CR>
" au BufRead,BufNewFile *.php nnoremap <buffer> <C-B> :call PhpDoc()<CR>
" au BufRead,BufNewFile *.php vnoremap <buffer> <C-B> :call PhpDocRange()<CR>

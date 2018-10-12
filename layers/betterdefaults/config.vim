scriptencoding utf-8

" Smarter cursorline {
augroup spacevimCursorline
  autocmd!
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
augroup END
" }

" https://github.com/vim/vim/pull/2198
" incsearch.vim {

" }

" vim-choosewin {
let g:choosewin_overlay_enable = 1
" }

" map y <Plug>(operator-flashy)
" nmap Y <Plug>(operator-flashy)$

" vim-better-whitespace
nnoremap <Leader>xd :StripWhitespace<CR>

" vim-choosewin
nmap <Leader>ww <Plug>(choosewin)

for s:i in range(1, 9)
  " <Leader>[1-9] move to window [1-9]
  execute 'nnoremap <Leader>' . s:i . ' :' . s:i . 'wincmd w<CR>'
  " <Leader><leader>[1-9] move to tab [1-9]
  execute 'nnoremap <Leader><Leader>' . s:i . ' ' . s:i . 'gt'
  " <Leader>b[1-9] move to buffer [1-9]
  execute 'nnoremap <Leader>b' . s:i . ' :b' . s:i . '<CR>'
endfor
unlet s:i

function! layers#betterdefaults#config#ToggleCursorColumn()
   if &cursorcolumn
     setlocal nocursorcolumn
   else
     setlocal cursorcolumn
   endif
 endfunction

function! layers#betterdefaults#config#ToggleColorColumn()
    if &colorcolumn
      setlocal colorcolumn=
    else
      setlocal colorcolumn=80
    endif
endfunction

" util
nnoremap <Leader>tc :call layers#betterdefaults#config#ToggleCursorColumn()<CR>
nnoremap <Leader>tC :call layers#betterdefaults#config#ToggleColorColumn()<CR>


scriptencoding utf-8

" formatting{ 
nnoremap <LocalLeader>= :Autoformat<CR>
" }

" tabular {
  nmap <Leader>a&     :Tabularize /&<CR>
  vmap <Leader>a&     :Tabularize /&<CR>
  nmap <Leader>a=     :Tabularize /^[^=]*\zs=<CR>
  vmap <Leader>a=     :Tabularize /^[^=]*\zs=<CR>
  nmap <Leader>a=>    :Tabularize /=><CR>
  vmap <Leader>a=>    :Tabularize /=><CR>
  nmap <Leader>a:     :Tabularize /:<CR>
  vmap <Leader>a:     :Tabularize /:<CR>
  nmap <Leader>a::    :Tabularize /:\zs<CR>
  vmap <Leader>a::    :Tabularize /:\zs<CR>
  nmap <Leader>a,     :Tabularize /,<CR>
  vmap <Leader>a,     :Tabularize /,<CR>
  nmap <Leader>a,,    :Tabularize /,\zs<CR>
  vmap <Leader>a,,    :Tabularize /,\zs<CR>
  nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
  vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }

" vim-easy-align {
  " Start interactive EasyAlign in visual mode (e.g. vipxa)
  xmap <Leader>xa <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. xaip)
  nmap <Leader>xa <Plug>(EasyAlign)

"   nmap <localleader><Cr> <Plug>(EasyAlign)
"   vmap <Cr> <Plug>(EasyAlign)
"   if !exists('g:easy_align_delimiters')
"       let g:easy_align_delimiters = {}
"   endif
"   let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
" }

" nerdcommenter {
let g:NERDSpaceDelims=1

nmap <Leader>;; <Plug>NERDCommenterToggle
omap <Leader>;; <Plug>NERDCommenterToggle
vmap <Leader>;; <Plug>NERDCommenterToggle
" }

" vim-multiple-cursors {
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<leader><C-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = '<localleader><C-n>'
"let g:multi_cursor_next_key            = '<C-n>'
"let g:multi_cursor_prev_key            = '<C-\>'
"let g:multi_cursor_skip_key            = '<C-h>'
"let g:multi_cursor_quit_key            = '<ESC>'
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
function! Multiple_cursors_before()
    if exists(':NeoCompleteLock') == 2
        exe 'NeoCompleteLock'
    endif
endfunction
function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock') == 2
        exe 'NeoCompleteUnlock'
    endif
endfunction
" }

" vim-swoop {
" Do not let vim-swoop create keybindings
let g:swoopUseDefaultKeyMap = 0
" Visual selection mode mapping: swoop current selection.
vmap <Leader>s :call SwoopMultiSelection()<CR>
" Normal mode mapping:
"   <Leader>ss to start swoop buffer.
"   <Leader>sm to swoop in multiple buffers.
nnoremap <Leader>ss :call Swoop()<CR>
nnoremap <Leader>sm :call SwoopMulti()<CR>
" }

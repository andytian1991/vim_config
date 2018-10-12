scriptencoding utf-8

" vim-move {
  " vim-move config
  " for terms that send Alt as Escape sequence
  " see http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
  " for why the <F20> hack. Keeps Esc from waiting for other keys to exit visual
  set <F20>=j
  set <F21>=k
  vmap <F20> <Plug>MoveBlockDown
  vmap <F21> <Plug>MoveBlockUp
  nmap <F20> <Plug>MoveLineDown
  nmap <F21> <Plug>MoveLineUp
  if g:vimbundle.nvim
    vmap <M-j> <Plug>MoveBlockDown
    vmap <M-k> <Plug>MoveBlockUp
    nmap <M-j> <Plug>MoveLineDown
    nmap <M-k> <Plug>MoveLineUp
  endif
" }

" rainbow {
  let g:rainbow_active = 1
  let g:rainbow_conf = {
            \   'guifgs': ['#4F97D7', '#D75F87', '#D697E6', '#40AF81', '#DA61AE', '#70AF67'],
            \   'ctermfgs': ['68', '168', '176', '104', '73', '212'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       '*': {},
            \       'tex': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \       },
            \       'lisp': {
            \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', '#FF69B4', '#DDA0DD', '#F08080', '#FF8C00', '#20B2AA'],
            \       },
            \       'vim': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \       },
            \       'html': {
            \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \       },
            \       'css': 0,
            \   }
            \}
" }

" rainbow_parentheses.vim {
"  augroup rainbowLisp
"    autocmd!
"    autocmd FileType lisp,clojure,scheme RainbowParentheses
"  augroup END
" }

" tagbar {
  let g:tagbar_sort = 0
  let g:tagbar_autofocus = 1
set tags=./tags;/,~/.cache/tags
" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif
  nnoremap <F6> :TagbarToggle<CR>
  inoremap <F6> <ESC>:TagbarToggle<CR>
  nnoremap <Leader>tt :TagbarToggle<CR>
nmap <silent><leader>tj :TagbarOpen j<CR>
" AutoCloseTag
" Make it so AutoCloseTag works for xml and xhtml files as well
au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
\ nmap <Leader>ta <Plug>ToggleAutoCloseMappings
" }

" vim-indent-guides {
  nnoremap <Leader>ti :IndentGuidesToggle<CR>
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level           = 2
"let g:indent_guides_guide_size            = 1
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey
" }

" vim-polyglot {
  " Reset errorformat to its default value for cooperating with asyncrun.vim
  autocmd BufEnter * set errorformat&
" }

" vim-rooter {
  " To stop vim-rooter echoing the project directory
  let g:rooter_silent_chdir = 1
" }

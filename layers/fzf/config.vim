
"{
"if g:browser_tool == "fzf"
"        nnoremap <silent>   <C-p>      :FZF<CR>
"        nnoremap <silent>   <leader>lb :Buffers<CR>
"        nnoremap <Leader>lf :FZF<Space>
"        nnoremap <silent>   <Leader>lt :Filetypes<CR>
"        nnoremap <silent>   <Leader>lg :GFiles?<CR>
"        nnoremap <silent>   <Leader>lm :Maps<CR>
"        nnoremap <silent>   <Leader>lc :Commits<CR>
"        nnoremap <silent>   <Leader>lk :Colors<CR>
"        nnoremap <silent>   <Leader>lh :History/<CR>
"        " Mapping selecting mappings
"        nmap <leader><tab> <plug>(fzf-maps-n)
"        xmap <leader><tab> <plug>        nnoremap <silent>   <C-p>      :FZF<CR>
"        nnoremap <silent>   <leader>lb :Buffers<CR>
"        nnoremap <Leader>lf :FZF<Space>
"        nnoremap <silent>   <Leader>lt :Filetypes<CR>
"        nnoremap <silent>   <Leader>lg :GFiles?<CR>
"        nnoremap <silent>   <Leader>lm :Maps<CR>
"        nnoremap <silent>   <Leader>lc :Commits<CR>
"        nnoremap <silent>   <Leader>lk :Colors<CR>
"        nnoremap <silent>   <Leader>lh :History/<CR>
"        " Mapping selecting mappings
"        nmap <leader><tab> <plug>(fzf-maps-n)
"        xmap <leader><tab> <plug>(fzf-maps-x)
"        omap <leader><tab> <plug>(fzf-maps-o)
"        " insert map
"        imap <c-x><c-k> <plug>(fzf-complete-word)
"        imap <c-x><c-f> <plug>(fzf-complete-path)
"        imap <c-x><c-j> <plug>(fzf-complete-file-ag)
"        imap <c-x><c-l> <plug>(fzf-complete-line)
"        " [Buffers] Jump to the existing window if possible
"        let g:fzf_buffers_jump = 1
"        " [[B]Commits] Customize the options used by 'git log':
"        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"        " [Tags] Command to generate tags file
"        let g:fzf_tags_command = 'ctags -R'
"        " [Commands] --expect expression for directly executing the command
"        let g:fzf_commands_expect = 'alt-enter,ctrl-x'
"        let g:fzf_colors =
"            \ { 'fg':      ['fg', 'Normal'],
"              \ 'bg':      ['bg', 'Normal'],
"              \ 'hl':      ['fg', 'Comment'],
"              \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"              \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"              \ 'hl+':     ['fg', 'Statement'],
"              \ 'info':    ['fg', 'PreProc'],
"              \ 'border':  ['fg', 'Ignore'],
"              \ 'prompt':  ['fg', 'Conditional'],
"              \ 'pointer': ['fg', 'Exception'],
"              \ 'marker':  ['fg', 'Keyword'],
"              \ 'spinner': ['fg', 'Label'],
"              \ 'header':  ['fg', 'Comment'] }
"            let g:fzf_layout = { 'down': '~40%' }
"        function! s:build_quickfix_list(lines)
"            call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
"            copen
"            cc
"        endfunction
"        let g:fzf_action = {
"            \ 'ctrl-q': function('s:build_quickfix_list'),
"            \ 'ctrl-t': 'tab split',
"            \ 'ctrl-x': 'split',
"            \ 'ctrl-v': 'vsplit'}
"elseif g:browser_tool == "LeaderF"
"        let g:Lf_ShortcutF = '<C-p>'
"        let g:Lf_PythonVersion = g:python_version
"        let g:Lf_ShortcutB = '<leader>B'
"        nmap <leader>lf :Leaderf
"        nmap <leader>lF :LeaderfF
"        nmap <leader>lb :LeaderfB
"        nmap <leader>lm :LeaderfM
"endif
"}

source ~/.vim/layers/fzf/fzf.vim

if g:vimbundle.gui && !has('terminal')
  " LeaderF {
  nnoremap <Leader>ff :LeaderfFile ~<CR>
  nnoremap <Leader>f? :LeaderfFile<CR>
  nnoremap <Leader>fr :LeaderfMru<CR>
  nnoremap <Leader>fl :LeaderfLine<CR>
  nnoremap <Leader>fL :LeaderfLineAll<CR>
  " }
else
  " fzf.vim {
  let $LANG = 'en_US'
  " Customize fzf colors to match your color scheme
  " Only suitable for space-vim-dark theme, other themes are not guaranteed.
  let g:fzf_colors = {'fg': ['fg', 'StatusLineNC'],'bg':['bg', 'Normal'],'hl':['fg', 'String'], 'fg+':['fg', 'Number', 'Normal'],'bg+':['bg', 'StatusLine', 'Normal'],'hl+':['fg', 'Exception'],'info':['fg', 'Special'],'prompt':['fg', 'Function'],'pointer': ['fg', 'Error'],'marker':['fg', 'Error'],'spinner': ['fg', 'Statement'],'header':['fg', 'Number'],}

  nmap <Leader>? <plug>(fzf-maps-n)
  xmap <Leader>? <plug>(fzf-maps-x)
  omap <Leader>? <plug>(fzf-maps-o)

  command! -nargs=* Rag call layers#fzf#fzf#AgInProject()
  nnoremap <Leader>ag :Ag!<CR>
  vnoremap <Leader>ag :<c-u>call layers#fzf#fzf#Vsearch()<CR>
  nnoremap <Leader>bb :Buffers<CR>

  nnoremap <Leader>b? :Buffers<CR>
  nnoremap <Leader>w? :Windows<CR>
  nnoremap <Leader>f? :Files<CR>

  nnoremap <Leader>ff :Files ~<CR>
  nnoremap <silent> <Leader>sf :call layers#fzf#fzf#Session()<CR>

  command! -bang -nargs=* Rg call layers#fzf#fzf#Rg(<q-args>, <bang>0)
  nnoremap <leader>rg :Rg!<cr>
  " }
endif

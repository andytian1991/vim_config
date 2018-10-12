" ctrlp.vim {
  let g:ctrlp_working_path_mode = 'ra'	" search for nearest ancestor like .git, .hg, and the directory of the current file
  let g:ctrlp_match_window_bottom = 0		" show the match window at the top of the screen
  let g:ctrlp_by_filename = 1
  let g:ctrlp_max_height = 10				" maxiumum height of match window
  let g:ctrlp_switch_buffer = 'et'		" jump to a file if it's open already
  let g:ctrlp_regexp = 1
  let g:ctrlp_use_caching = 1				" enable caching
  let g:ctrlp_clear_cache_on_exit=0  		" speed up by not removing clearing cache evertime
  let g:ctrlp_mruf_max = 250 				" number of recently opened files
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_follow_symlinks=1
  let g:ctrlp_mruf_relative = 1
  let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*'
  let g:ctrlp_custom_ignore = {
              \ 'dir':  '\v[\/]\.(git|hg|svn|build)$',
              \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
              \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
              \ }

  " If ag available, use it to replace grep
  if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " Ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  else
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
  endif

  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  nnoremap <Leader>fr :CtrlPMRU<CR>
  nnoremap <C-p> :CtrlP<CR>

"        if executable('ag')
"            let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
"        elseif executable('ack-grep')
"            let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
"        elseif executable('ack')
"            let s:ctrlp_fallback = 'ack %s --nocolor -f'
"            " On Windows use "dir" as fallback command.
"        elseif WINDOWS()
"            let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
"        else
"            let s:ctrlp_fallback = 'find %s -type f'
"        endif
"        if exists("g:ctrlp_user_command")
"            unlet g:ctrlp_user_command
"        endif
"        let g:ctrlp_user_command = {
"                \ 'types': {
"                    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
"                    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
"                \ },
"                \ 'fallback': s:ctrlp_fallback
"            \ }

"   ctrlp-funky
"   CtrlP extensions
"   let g:ctrlp_extensions = ['funky']
"   funky
"   nnoremap <Leader>lf :CtrlPFunky<Cr>
" }

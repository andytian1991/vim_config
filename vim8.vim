function! s:lod(...)
  " Ignore unknown plugins from vim-plug due to the excluded plugins
  for l:plug in a:000
    silent! call plug#load(l:plug)
  endfor
endfunction

function! vim8#deferunite(timer) abort
  call s:lod('unite.vim')
endfunction

" 200
function! vim8#deferale(timer) abort
  call s:lod('ale')
endfunction

" 250
function! vim8#deferairline(timer) abort
  call s:lod('vim-airline', 'vim-airline-themes')
  redraws!
endfunction

" 300
function! vim8#defergitgutter(timer) abort
  call s:lod('vim-gitgutter')
  silent! GitGutterEnable
endfunction

" 400
function! vim8#deferprogramming(timer) abort
  call s:lod('rainbow', 'vim-rooter', 'vim-polyglot')
endfunction

" 500
function! vim8#deferdefaults(timer) abort
  if has('patch-8.0.1206') || has('nvim-0.2.3')
    call s:lod('traces.vim')
  endif
  call s:lod('vim_current_word', 'vim-signature', 'vim-rsi')
endfunction

" 600
function! vim8#defermotion(timer) abort
  call s:lod('vim-sneak', 'vim-easymotion', 'incsearch-easymotion.vim')
endfunction

" 700
function! vim8#deferfzf(timer) abort
  call s:lod('fzf', 'fzf.vim')
endfunction

" 800
function! vim8#deferfugitive(timer) abort
  call s:lod('vim-fugitive')
endfunction

" 1000
function! vim8#deferycm(timer) abort
  call s:lod('YouCompleteMe')
endfunction



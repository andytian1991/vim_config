"==========================================
" Author:  Tian Yang -- forked from wklken
" Version: 9.1
" Email: wklken@yeah.net
" BlogPost: http://www.wklken.me
" ReadMe: README.md
" Donation: http://www.wklken.me/pages/donation.html
" Last_modify: 2015-12-15
" Sections:
"       -> Initial Plugin 加载插件
"       -> General Settings 基础设置
"       -> Display Settings 展示/排版等界面格式设置
"       -> FileEncode Settings 文件编码设置
"       -> Others 其它配置
"       -> HotKey Settings  自定义快捷键
"       -> FileType Settings  针对文件类型的设置
"       -> Theme Settings  主题设置
"
"       -> 插件配置和具体设置在vimrc.bundles中
"==========================================

"==========================================
" Initial Plugin 加载插件
"==========================================
" 修改leader键
let mapleader = ','
let g:mapleader = ','

" 打开语法高亮
syntax enable
" syntax on

" install bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
  source ~/.config/nvim/vimrc.bundles
endif

" 启动自动补全
filetype plugin indent on
"==========================================
" General Settings 基础设置
"==========================================

" 关闭兼容模式 ty
set nocompatible 

" history存储容量
set history=2000

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" 文件修改之后自动载入
set autoread
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI

" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

" 取消备份
set nobackup
" 关闭交换文件
set noswapfile

" 覆盖文件时建立备份 tyty
"set writebackup

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn    " tytyty my is not set enable

" 突出显示当前列
"set cursorcolumn
" 突出显示当前行
set cursorline

" 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
" 好处是如果有误删什么的，可以找回
"set t_ti= t_te=

" 鼠标暂不启用, 键盘党....
"set mouse-=a
" 启用鼠标
set mouse=a
" Hide the mouse cursor while typing
" set mousehide

" remote settings, not enable now
" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
"set selection=inclusive
"set selectmode=mouse,key

" terminal 标题显示当前编辑文件名
"set title
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
" 关闭提示音
set t_vb= 
set tm=500

" Remember info about open buffers on close
set viminfo^=%

" 设置正则表达式中哪些元字符要加反斜杠哪些不用加
" magic(\m)：除了 $ . * ^ 之外其他元字符都要加反斜杠。
" nomagic(\M)：除了 $ ^ 之外其他元字符都要加反斜杠。
" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
"set showmatch 
" How many tenths of a second to blink when matching brackets
"set mat=2

" Add a bit extra margin to the left
"set foldcolumn=1

"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=5

" 命令行的高度，默认为1，这里设为2  tytyty
set cmdheight=2

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" below is from amix
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" 一直打开状态栏
set laststatus=2

" 显示行号
set nu
" set number
" 取消长行显示自动折行
set nowrap

" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" Vim在匹配括号上停留的时间
set matchtime=2

" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 搜索到文件两端时不重新搜索
"set nowrapscan

" Don't redraw while executing macros (good performance config)
"set lazyredraw 

" 允许在有未保存的修改时切换缓冲区
set hidden
" 显示Tab符，使用一高亮竖线代替
set list
set listchars=tab:\|\ ,

" 设定文件浏览器目录为当前目录
set autochdir

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
" 选择代码折叠类型
set foldmethod=syntax
set foldlevel=100
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" 缩进配置
" 自动缩进
set autoindent
" C 语言风格缩进
set smartindent

" 每一次缩进对应的空格数为4个空格
" 设置<TAB> 字符所代表的空格数
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" <BS>删除的空格数，是 <TAB> 插入的空格,不是用 <SPACE> 插入的空格
set softtabstop=4
" 只作用于行首位置
" 当smarttab开启时，在行首键入<TAB>会填充shiftwidth设定的数值，在其他地方则填充tabstop设定的数值；
" 当smarttab关闭时，无论在哪里键入<TAB>都会填充tabstop设定的数值。
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
" set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
"set shiftround

" 设置退格键可用
set backspace=2
" 设置<BS>键在“缩进位置”，“行结束符”，“段首”这三个特殊的位置也能进行回删动作
set backspace=eol,start,indent

" C语言自动缩进4空格
set cindent shiftwidth=4

" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
" set shiftround

set whichwrap+=<,>,h,l

" Linebreak on 500 characters
set lbr
set tw=500

" A buffer becomes hidden when it is abandoned
"set hidden
"set wildmode=list:longest
"set ttyfast

" 00x增减数字时使用十进制
"set nrformats=

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
"set relativenumber number
"au FocusLost * :set norelativenumber number
"au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
"autocmd InsertEnter * :set norelativenumber number
"autocmd InsertLeave * :set relativenumber
"function! NumberToggle()
"  if(&relativenumber == 1)
"    set norelativenumber number
"  else
"    set relativenumber
"  endif
"endfunc
"nnoremap <C-n> :call NumberToggle()<cr>

" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"==========================================
" FileEncode Settings 文件编码,格式
"==========================================

" 设置新文件的编码为 UTF-8
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1

" 自动判断编码时，依次尝试以下编码：
"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

" 每行超过80个的字符用下划线标示
"au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml 2match Underlined /.\%81v/

"==========================================
" others 其它设置
"==========================================

" vimrc文件修改之后自动加载, windows
autocmd! bufwritepost _vimrc source %
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
" check amix vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 离开插入模式后自动关闭预览窗口
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 回车即选中当前项
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
"autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
"autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
"autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

" command-line window
"autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>

" 上下左右键的行为 会显示其他信息
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================
"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" F1 - F6 设置
" F1 废弃这个键,防止调出系统帮助
noremap <F1> <Esc>"

" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
"function! HideNumber()
"  if(&relativenumber == &number)
"    set relativenumber! number!
"  elseif(&number)
"    set number!
"  else
"    set relativenumber!
"  endif
"  set number?
"endfunc
"nnoremap <F2> :call HideNumber()<CR>
" F3 显示可打印字符开关
"set listchars=tab:>-,eol:<
nnoremap <F3> :set list! list?<CR>
" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" when in insert mode, press <F5> to go to paste mode,
" where you can paste mass data that won't be autoindented
"set pastetoggle=<F5>

" disbale paste mode when leaving insert mode
"au InsertLeave * set nopaste

" F5 set paste问题已解决, 粘贴代码前不需要按F5了
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
"function! XTermPasteBegin()
"  set pastetoggle=<Esc>[201~
"  set paste
"  return ""
"endfunction
"inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" 分屏窗口移动, Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Close the current buffer
"map <leader>bd :Bclose<cr>:tabclose<cr>gT

" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
"function! s:ZoomToggle() abort
"    if exists('t:zoomed') && t:zoomed
"        execute t:zoom_winrestcmd
"        let t:zoomed = 0
"    else
"        let t:zoom_winrestcmd = winrestcmd()
"        resize
"        vertical resize
"        let t:zoomed = 1
"    endif
"endfunction
"command! ZoomToggle call s:ZoomToggle()
"nnoremap <silent> <Leader>z :ZoomToggle<CR>

" Go to home and end using capitalized directions
"noremap H ^
"noremap L $

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" 命令行模式增强，ctrl - a到行首， -e 到行尾
"cnoremap <C-j> <t_kd>
"cnoremap <C-k> <t_ku>
"cnoremap <C-a> <Home>
"cnoremap <C-e> <End>

" 搜索相关
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
" this part from amix vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
"map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

"if has("autocmd")
"    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
"endif

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
"vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
"vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Keep search pattern at the center of the screen.
"nnoremap <silent> n nzz
"nnoremap <silent> N Nzz
"nnoremap <silent> * *zz
"nnoremap <silent> # #zz
"nnoremap <silent> g* g*zz

" switch # *
"nnoremap # *
"nnoremap * #

" for # indent, python文件中输入新行时#号注释不切回行首
"autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#

" tab/buffer相关

" 切换前后buffer
"nnoremap [b :bprevious<cr>
"nnoremap ]b :bnext<cr>
" 使用方向键切换buffer
"noremap <left> :bp<CR>
"noremap <right> :bn<CR>


" tab 操作
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim

" tab切换
"map <leader>th :tabfirst<cr>
"map <leader>tl :tablast<cr>

"map <leader>tj :tabnext<cr>
"map <leader>tk :tabprev<cr>
"map <leader>tn :tabnext<cr>
"map <leader>tp :tabprev<cr>

"map <leader>te :tabedit<cr>
"map <leader>td :tabclose<cr>
"map <leader>tm :tabm<cr>

" normal模式下切换到确切的tab
"noremap <leader>1 1gt
"noremap <leader>2 2gt
"noremap <leader>3 3gt
"noremap <leader>4 4gt
"noremap <leader>5 5gt
"noremap <leader>6 6gt
"noremap <leader>7 7gt
"noremap <leader>8 8gt
"noremap <leader>9 9gt
"noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
"let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
"nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
"autocmd TabLeave * let g:last_active_tab = tabpagenr()

" 新建tab  Ctrl+t
"nnoremap <C-t>     :tabnew<CR>
"inoremap <C-t>     <Esc>:tabnew<CR>

" => 选中及操作改键
" 调整缩进后自动选中，方便再次操作
"vnoremap < <gv
"vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
"map Y y$

" 复制选中区到系统剪切板中
"vnoremap <leader>y "+y

" auto jump to end of select
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

" select all
"map <Leader>sa ggVG

" 选中并高亮最后一次插入的内容
"nnoremap gv `[v`]

" select block
"nnoremap <leader>v V`}

" w!! to sudo & write a file
"cmap w!! w !sudo tee >/dev/null %

" kj 替换 Esc
"inoremap kj <Esc>

" 滚动Speed up scrolling of the viewport slightly
"nnoremap <C-e> 2<C-e>
"nnoremap <C-y> 2<C-y>


" Jump to start and end of line using the home row keys
" 增强tab操作, 导致这个会有问题, 考虑换键
"nmap t o<ESC>k
"nmap T O<ESC>j

" Quickly close the current window
"nnoremap <leader>q :q<CR>

" Quickly save the current file
"nnoremap <leader>w :w<CR>

" 交换 ' `, 使得可以快速使用'跳到marked位置
"nnoremap ' `
"nnoremap ` '

" remap U to <C-r> for easier redo
"nnoremap U <C-r>

"==========================================
" FileType Settings  文件类型设置
"==========================================
" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

" disable showmatch when use > in php
au BufWinEnter *.php set mps-=<:>

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
"autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd FileType go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        " call setline(1, "\#!/usr/bin/env python")
        " call append(1, "\# encoding: utf-8")
        call setline(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc

" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

"==========================================
" Theme Settings  主题设置
"==========================================
set t_Co=256

" 配色主题的色系，dark是暗色系，light是亮色系。
set background=dark

" 配色主题的名称
"colorscheme elflord          
"colorscheme solarized
colorscheme molokai
"colorscheme desert

" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline



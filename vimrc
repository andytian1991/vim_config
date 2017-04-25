"==========================================
" Author:  wklken
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

" install bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
  source ~/.config/nvim/vimrc.bundles
endif

" NOTE: 以下配置有详细说明，一些特性不喜欢可以直接注解掉

"==========================================
" General Settings 基础设置
"==========================================

" 关闭兼容模式
set nocompatible 

" 打开语法高亮
syntax enable
" syntax on

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

" 设置无备份文件
set writebackup

" 关闭交换文件
"set noswapfile

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn    " my is not set enable

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
"set viminfo^=%

" 设置正则表达式中哪些元字符要加反斜杠哪些不用加
" magic(\m)：除了 $ . * ^ 之外其他元字符都要加反斜杠。
" nomagic(\M)：除了 $ ^ 之外其他元字符都要加反斜杠。
"set magic

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
"set scrolloff=7

" 命令行的高度，默认为1，这里设为2
set cmdheight=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" 一直打开状态栏
set laststatus=2

" 显示行号
set nu!
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

" 允许在有未保存的修改时切换缓冲区
set hidden
" 显示Tab符，使用一高亮竖线代替
set list
set listchars=tab:\|\ ,

" 设定文件浏览器目录为当前目录
set autochdir

" 选择代码折叠类型
set foldmethod=syntax
" 禁止自动折叠
set foldlevel=100

" 缩进配置
" 自动缩进
set autoindent
" C 语言风格缩进
set smartindent
" 只作用于行首位置
" 当smarttab开启时，在行首键入<TAB>会填充shiftwidth设定的数值，在其他地方则填充tabstop设定的数值；
" 当smarttab关闭时，无论在哪里键入<TAB>都会填充tabstop设定的数值。
set smarttab
" 每一次缩进对应的空格数为4个空格
" 设置<TAB> 字符所代表的空格数
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4

" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
" set expandtab

" <BS>删除的空格数，是 <TAB> 插入的空格,不是用 <SPACE> 插入的空格
set softtabstop=4
" 设置退格键可用
set backspace=2
" 设置<BS>键在“缩进位置”，“行结束符”，“段首”这三个特殊的位置也能进行回删动作
set backspace=eol,start,indent

" C语言自动缩进4空格
set cindent shiftwidth=4

" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
" set shiftround


"set whichwrap+=<,>,h,l
" A buffer becomes hidden when it is abandoned
"set hidden
"set wildmode=list:longest
"set ttyfast

" 00x增减数字时使用十进制
"set nrformats=

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
set formatoptions+=B         " 合并两行中文时，不在中间加空格

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

"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================
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
set pastetoggle=<F5>            

"==========================================
" Theme Settings  主题设置
"==========================================

" GUI模式下的附加设置
if has("gui_running")
    set guifont=Monaco:h14
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif    

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



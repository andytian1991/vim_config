"==========================================
" Author:  Tian Yang -- thanks to  wklken
" ReadMe: README.md
" Last_modify:
" Sections:
"       -> Initial Plugin 加载插件
"       -> Theme Settings  主题设置
"       -> General Settings 基础设置
"       -> FileEncode Settings 文件编码设置
"       -> Others 其它配置
"       -> FileType Settings  针对文件类型的设置
"       -> HotKey Settings  自定义快捷键
"
"       -> 插件配置和具体设置在vimrc.bundles中
"==========================================
scriptencoding utf-8
set nocompatible " 关闭兼容模式

let vim_plug_path =  '~/.vim/autoload/plug.vim'
if empty(glob(vim_plug_path))
  echo '==> Downloading vim-plug ......'
  execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

"==========================================
" Initial Plugin 加载插件
"==========================================
"let s:save_cpo = &cpo
"set cpo&vim

let g:mapleader = get(g:, 'vim_leader', "\<Space>")
let g:maplocalleader = get(g:, 'vim_localleader', ',')

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

"==========================================
" Theme Settings  主题设置
"==========================================
set t_Co=256         "Use 256 colors
set background=dark  " 配色主题的色系，dark是暗色系，light是亮色系。

silent! color space-vim-dark
"silent! color molokai
" 配色主题的名称
"colorscheme elflord
"colorscheme solarized
"colorscheme molokai
"colorscheme desert

"==========================================
" General Settings 基础设置
"==========================================
syntax on                 " 语法高亮Syntax highlighting
" http://vim.wikia.com/wiki/Speed_up_Syntax_Highlighting
autocmd BufEnter * :syntax sync maxlines=200

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on " 启动自动补全Automatically detect file types

set nu                    " 显示行号Line numbers on  "set number
set nowrap                " 取消长行显示自动折行Do not wrap long lines
set ruler                 " 显示当前的行号列号Show the ruler
set showcmd               " 在状态栏显示正在输入的命令Show partial commands in status line
set showmode              " 左下角显示当前vim模式Show current mode in command-line
set cursorline            " 突出显示当前行Highlight current line
set history=10000         " max history record
set mouse=nvi             " 启用鼠标Automatically enable mouse usage
set ttymouse=xterm2       " spacevim

"Clipboard
"if has('clipboard')
"    if has('unnamedplus') " When possible use +register for copy-paste
"        set clipboard=unnamed,unnamedplus
"    else                  " On mac and Windows, use *register for copy-paste
"        set clipboard=unnamed
"    endif
"endif
set clipboard=exclude:.*

set colorcolumn=80       " 80 chars/line"
set nostartofline        " Keep the cursor on the same column
set scrolljump=5         " Line to scroll when cursor leaves screen
set scrolloff=3          " Minumum lines to keep above and below cursor
set splitright           " Puts new vsplit windows to the right of the current
set splitbelow           " Puts new split windows to the bottom of the current
set autowrite            " Automatically write file when leaving modified buffer
set report=0             " Always report changed lines
set linespace=0          " No extra spaces between rows

set hlsearch             " 高亮search命中的文本 Highlight search terms
set incsearch            " 打开增量搜索模式,随着键入即时搜索Search as you type
set ignorecase           " 搜索时忽略大小写Case insensitive search
"set smartcase           " 有大写字母时大小写敏感Case sensitive when uc present

set showmatch            " 跳转并高亮匹配的括号Show matched brackets/parentthesis
set matchtime=2          " Vim在匹配括号上停留的时间" Show matching time(s)

" 每一次缩进对应的空格数为4个空格
set tabstop=4            " 设置<TAB> 字符所代表的空格数An indentation every four columns
set shiftwidth=4         " 每一次缩进对应的空格数Use indents of 4 spaces
set softtabstop=4        " <BS>删除的空格数，是 <TAB> 插入的空格,不是用 <SPACE> 插入的空格Let backspace delete indent
set smarttab             " Smart tab
"set expandtab smarttab   " 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab] " Tabs are spaces, not tabs

" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround
set autoindent           " 自动缩进Indent at the same level of the previous line
set smartindent          " C 语言风格缩进
set cindent shiftwidth=4 " C语言自动缩进4空格

" 设置<BS>键在“缩进位置”，“行结束符”，“段首”这三个特殊的位置也能进行回删动作Backspace for dummies
set backspace=eol,start,indent
set backspace=2          " 设置退格键可用
set whichwrap+=<,>,h,l   " Allow backspace and cursor keys to cross line boundaries  whichwrap=b,s,h,l,<,>,[,]
set lbr                  " Linebreak on 500 characters
set tw=500

set list                 " 显示Tab符，使用一高亮竖线代替
set listchars=tab:\|\ ,
"(spacevim)set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
"set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

set nobackup             " 取消备份
set noswapfile           " 关闭交换文件
"set writebackup         " 覆盖文件时建立备份
"set backup              " 备份,到另一个位置. 防止误删, 目前是取消备份
"set backupext=.bak
"set backupdir=/tmp/vimbk/

set laststatus=2         " 一直打开状态栏Always show status line
"set cmdheight=2         " 命令行（在状态行下）的高度，默认为1，这里设为2
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" below is from amix
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

set wildmenu             "增强模式中的命令行自动完成操作Show list instead of just completing
set wildmode=list:longest,full       " Command <Tab> completion, list matches, then longest common part, then all.

set autoread             " 文件修改之后自动载入Automatically read a file changed outside of vim
set hidden               " 允许在有未保存的修改时切换缓冲区Allow buffer switching without saving
set shortmess=atI        " No help Uganda info,and overwrite read messages to avoid PRESS ENTER prompts
set ttyfast              " Faster redrawing
set lazyredraw           " Don't redraw while executing macros (good performance config)
set magic

set novisualbell         " 去掉输入错误的提示声音  " No annoying sound on errors
set noerrorbells         " 去掉输入错误的提示声音  " No annoying sound on errors
set t_vb=                " 关闭提示音
set viminfo^=%           " Remember info about open buffers on close
"(spacevim)set viminfo+=!" Viminfo include !
"(amux)set viminfo^=!

set fillchars=vert:│,stl:\ ,stlnc:\  "在被分割的窗口间显示空白，便于阅读
highlight clear SignColumn           " SignColumn should match background
"highlight clear LineNr              " Current line number row will have same background color in relative mode

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

" Refer: http://sunaku.github.io/vim-256color-bce.html 
" 防止tmux下vim的背景色显示异常
"if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  " http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
"set t_ut= 
"endif

" Annoying temporary files
"set directory=/tmp//,.
"set backupdir=/tmp//,.
"if v:version >= 703
"  set undodir=/tmp//,.
"endif
"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
set fenc=utf-8           " 设置新文件的编码为UTF-8 set fileencoding=utf-8
set encoding=utf-8       " Set default encoding
set fileencodings=utf-8,gbk,big5,cp936,latin-1,utf-16

"==========================================
" others 其它设置
"==========================================
set completeopt=longest,menu              "自动补全配置,让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

"set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
"set wildignore=*.o,*~,*.pyc,*.class
set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip
set wildignore+=*/tmp/*,*.o,*.obj,*.so    " Unix
set wildignore+=*\\tmp\\*,*.exe           " Windows

" 代码折叠
set foldenable
set foldmarker={,}
set foldlevel=0
set foldmethod=marker
"set foldcolumn=2
set foldlevelstart=99

"==========================================
" FileType Settings  文件类型设置
"==========================================
" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" .vimrc文件修改之后自动加载
autocmd! bufwritepost .vimrc source %     
" Reload .vimrc
nnoremap <Leader>fR :source $MYVIMRC<CR>

" 保存文件时删除多余空格Delete trailing whitespace on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()

"==========================================
" HotKey Settings  自定义快捷键设置 vim_better_key_mapping
"==========================================
" Key (re)Mappings {
    " Basic {
        " Quit normal mode
        nnoremap <silent> <Leader>q  :q<CR>
        nnoremap <Leader>Q  :qa!<CR>
        " Bash like
        inoremap <C-a> <Home>
        inoremap <C-e> <End>
        inoremap <C-d> <Delete>
        " Command mode shortcut
        cnoremap <C-h> <BS>
        cnoremap <C-j> <Down>
        cnoremap <C-k> <Up>
        cnoremap <C-b> <Left>
        cnoremap <C-f> <Right>
        cnoremap <C-a> <Home>
        cnoremap <C-e> <End>
        cnoremap <C-d> <Delete>
        " Move to the start of line
        nnoremap H ^
        " Move to the end of line
        nnoremap L $
        " Redo
        nnoremap U <C-r>
        " Quick command mode
        nnoremap <CR> :
        " In the quickfix window, <CR> is used to jump to the error under the
        " cursor, so undefine the mapping there.
        autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
    " }

    " Buffer {
        nnoremap <Leader>bp :bprevious<CR>
        nnoremap <Leader>bn :bnext<CR>
        nnoremap <Leader>bf :bfirst<CR>
        nnoremap <Leader>bl :blast<CR>
        nnoremap <Leader>bd :bd<CR>
        nnoremap <Leader>bk :bw<CR>
        "nnoremap <Tab> :bn<CR>
        "nnoremap <S-Tab> :bp<CR>
        "nnoremap [b :bprevious<cr>
        "nnoremap ]b :bnext<cr>
        "noremap <left> :bp<CR>
        "noremap <right> :bn<CR>
    " }

    " Tab {
    " http://vim.wikia.com/wiki/Alternative_tab_navigation
    " http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim

        " 新建tab  Ctrl+t
        nnoremap <C-t>     :tabnew<CR>
        inoremap <C-t>     <Esc>:tabnew<CR>

		" tab切换
		map <leader>th :tabfirst<cr>
		map <leader>tl :tablast<cr>
		map <leader>tj :tabnext<cr>
		map <leader>tk :tabprev<cr>
		map <leader>tn :tabnext<cr>
		map <leader>tp :tabprev<cr>
		map <leader>te :tabedit<cr>
		map <leader>td :tabclose<cr>
		map <leader>tm :tabm<cr>

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
    "}

    " Fold {
        nnoremap <Leader>f0 :set foldlevel=0<CR>
        nnoremap <Leader>f1 :set foldlevel=1<CR>
        nnoremap <Leader>f2 :set foldlevel=2<CR>
        nnoremap <Leader>f3 :set foldlevel=3<CR>
        nnoremap <Leader>f4 :set foldlevel=4<CR>
        nnoremap <Leader>f5 :set foldlevel=5<CR>
        nnoremap <Leader>f6 :set foldlevel=6<CR>
        nnoremap <Leader>f7 :set foldlevel=7<CR>
        nnoremap <Leader>f8 :set foldlevel=8<CR>
        nnoremap <Leader>f9 :set foldlevel=9<CR>
    " }

    " Window {
        nnoremap <Leader>ww <C-W>w
        nnoremap <Leader>wr <C-W>r
        nnoremap <Leader>wd <C-W>c
        nnoremap <Leader>wq <C-W>q
        nnoremap <Leader>wj <C-W>j
        nnoremap <Leader>wk <C-W>k
        nnoremap <Leader>wh <C-W>h
        nnoremap <Leader>wl <C-W>l
        nnoremap <Leader>wH <C-W>5<
        nnoremap <Leader>wL <C-W>5>
        nnoremap <Leader>wJ :resize +5<CR>
        nnoremap <Leader>wK :resize -5<CR>
        nnoremap <Leader>w= <C-W>=
        nnoremap <Leader>ws <C-W>s
        nnoremap <Leader>w- <C-W>s
        nnoremap <Leader>wv <C-W>v
        nnoremap <Leader>w\| <C-W>v
        nnoremap <Leader>w2 <C-W>v
    " }
" }

"#########################
" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" select all
map <Leader>sa ggVG

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
"Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" 设置分割页面
nmap <leader>\ :vsplit<Space>
nmap <leader><leader>\ :split<Space>

" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Toggle pastemode
nnoremap <Leader>tp :setlocal paste!<CR>

"vnoremap < <gv " 调整缩进后自动选中，方便再次操作" Visual shifting (does not exit Visual mode)
"vnoremap > >gv " 调整缩进后自动选中，方便再次操作" Visual shifting (does not exit Visual mode)

" 设置快捷键将选中文本块复制至系统剪贴板
"vnoremap <leader>y  "+y
"nnoremap <leader>y  "+y
"nnoremap <leader>yy "+yy
"nnoremap <leader>Y  "*y
"vnoremap <leader>Y  "*y
"nnoremap Y y$
"vnoremap Y *y$
" p and P for paste
"nnoremap <leader>p "+p
"nnoremap <leader>P "*P
"vnoremap <leader>p "+p
"vnoremap <leader>P "*P

"let &cpo = s:save_cpo
"unlet s:save_cpo

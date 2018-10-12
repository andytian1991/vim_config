"vim-gutentags
set tags=./.tags;,.tags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand("~/.cache/tags")
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif

let s:modules = ['ctags']

if executable('gtags-cscope') && executable('gtags')
	let s:modules += ['gtags_cscope']
endif

let s:vim_tags = expand('~/.cache/tags')
" create if ~/.cache/tags does not exist
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif

let g:spacevim#vim#ctags#cache_dir = s:vim_tags

function! layers#ctags#config#gutentagsInit()
	let g:gutentags_ctags_tagfile = '.tags'
	" set default tags file name `tags` to `.tags`
	set tags=./.tags;,.tags

	let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
	let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
	let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

	let g:gutentags_modules = s:modules

	" Specifies a directory in which to create all the tags files
	let g:gutentags_cache_dir = s:vim_tags

	let g:gutentags_auto_add_gtags_cscope = 0
endfunction


scriptencoding utf-8

let s:ignore = [
              \ '\.py[cd]$', '\~$', '\.swo$', '\.swp$', '\.DS_Store$',
              \ '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$',
              \ ]
let s:IndicatorMapCustom = {
            \ 'Modified'  : '✹',
            \ 'Staged'    : '✚',
            \ 'Untracked' : '✭',
            \ 'Renamed'   : '➜',
            \ 'Unmerged'  : '═',
            \ 'Deleted'   : '✖',
            \ 'Dirty'     : '✗',
            \ 'Clean'     : '✓',
            \ 'Unknown'   : '?'
            \ }

let s:colors = {}
" you can add these colors to your .vimrc to help customizing
let s:colors.brown = '905532'
let s:colors.aqua =  '3AFFDB'
let s:colors.blue = '689FB6'
let s:colors.darkBlue = '44788E'
let s:colors.purple = '834F79'
let s:colors.lightPurple = '834F79'
let s:colors.red = 'AE403F'
let s:colors.beige = 'F5C06F'
let s:colors.yellow = 'F09F17'
let s:colors.orange = 'D4843E'
let s:colors.darkOrange = 'F16529'
let s:colors.pink = 'CB6F6F'
let s:colors.salmon = 'EE6E73'
let s:colors.green = '8FAA54'
let s:colors.lightGreen = '31B53E'
let s:colors.white = 'FFFFFF'
let s:colors.rspec_red = 'FE405F'
let s:colors.git_orange = 'F54D27'

let s:ExtensionHighlightColor = {} " this line is needed to avoid error
let s:ExtensionHighlightColor['css'] = s:colors.blue " sets the color of css files to blue
let s:ExtensionHighlightColor = {} " this line is needed to avoid error
let s:ExtensionHighlightColor['python'] = s:colors.green " sets the color of css files to blue
let s:ExtensionHighlightColor = {} " this line is needed to avoid error
let s:ExtensionHighlightColor['org'] = s:colors.pink " sets the color of css files to blue

let s:ExactMatchHighlightColor = {} " this line is needed to avoid error
let s:ExactMatchHighlightColor['tex'] = s:colors.rspec_red " sets the color of css files to blue
let s:ExactMatchHighlightColor = {} " this line is needed to avoid error
let s:ExactMatchHighlightColor['.gitignore'] = s:colors.git_orange " sets the color for .gitignore files
let s:ExactMatchHighlightColor = {} " this line is needed to avoid error
let s:ExactMatchHighlightColor['.ipynb'] = s:colors.lightPurple " sets the color for .ipynb files
let s:ExactMatchHighlightColor = {} " this line is needed to avoid error
let s:ExactMatchHighlightColor['.py'] = s:colors.red " sets the color for .ipynb files

let s:PatternMatchHighlightColor = {} " this line is needed to avoid error
let s:PatternMatchHighlightColor['.*_spec\.rb$'] = s:colors.rspec_red " sets the color for files ending with _spec.rb
let s:PatternMatchHighlightColor = {} " this line is needed to avoid error
let s:PatternMatchHighlightColor['*.py$'] = s:colors.red " sets the color for files ending with _spec.rb

function! layers#filemanager#nerdtree#Init()
  let g:NERDTreeShowHidden=1
  let g:NERDTreeAutoDeleteBuffer=1
  let g:NERDTreeDirArrowExpandable = "\u276f"
  let g:NERDTreeDirArrowCollapsible = "~"
  let g:NERDTreeIgnore = s:ignore


" nerdtree-git-plugin {
  let g:NERDTreeIndicatorMapCustom = s:IndicatorMapCustom
" }

  let g:NERDTreeExtensionHighlightColor = s:ExtensionHighlightColor " this line is needed to avoid error
  let g:NERDTreeExactMatchHighlightColor = s:ExactMatchHighlightColor " this line is needed to avoid error

"        let g:NERDShutUp                            = 1
"        let s:has_nerdtree                          = 1
"        let g:nerdtree_tabs_open_on_gui_startup     = 0
"        let g:nerdtree_tabs_open_on_console_startup = 0
"        let g:nerdtree_tabs_smart_startup_focus     = 2
"        let g:nerdtree_tabs_focus_on_files          = 1
"        let g:NERDTreeWinSize                       = 30
"        let g:NERDTreeShowBookmarks                 =1
"        let g:nerdtree_tabs_smart_startup_focus     = 0
"        let g:NERDTreeChDirMode                 =0
"        let g:NERDTreeQuitOnOpen                =1
"        let g:NERDTreeMouseMode                 =2
"        let g:NERDTreeShowHidden                =1
"        let g:NERDTreeKeepTreeInNewTab          =1
"        let g:nerdtree_tabs_focus_on_files      = 1
"        let g:nerdtree_tabs_open_on_gui_startup = 0
"        let g:NERDTreeWinPos                    =0
"        let g:NERDTreeDirArrowExpandable        = '▸'
"        let g:NERDTreeDirArrowCollapsible       = '▾'

endfunction

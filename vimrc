set nu
set ts=4
set expandtab

set showmatch
set ignorecase
let loaded_matchparen=1
set smartindent  shiftwidth=4
set autoindent
set cindent
set hlsearch
set incsearch
colorscheme desert
set backspace=2
"set backspace=indent,eol,start
"highlight Pmenu ctermbg=darkgreen
"highlight PmenuSel ctermfg=green ctermfg=white

"let loaded_matchparen = 0
"hi MatchParen ctermbg=blue guibg=lightblue

set showcmd
set ruler
set completeopt=preview,menu
set scrolloff=3
"set mouse=v
"set cursorline

syntax enable
syntax on

set foldenable
set tags=./tags;,tags
set tags+=/usr/include/c++/4.8.2/stdcpp.tags
"set autochdir
nmap <C-]> g]

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

"taglist commmand
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Highlight_tag=1
let Tlist_Auto_Update=1
"let Tlist_WinWidth=30
nmap <silent> <F9> :TlistToggle<CR>

" NERDTree config
map <F8> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDChristmasTree=1
" show hide file
let NERDTreeShowHidden=1
" set wide-size
let NERDTreeWinSize=25
" ignore files
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin() 

" Install YouCompleteMe
Plugin 'Valloric/YouCompleteMe' " code completion
Plugin 'scrooloose/syntastic'   " syntax check
"Plugin 'davidhalter/jedi'   " python completion
call vundle#end()
filetype plugin indent on

" YCM Setting
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
highlight Pmenu ctermbg=darkgreen
highlight PmenuSel ctermbg=green ctermfg=white
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口  
"回车即选中当前项 
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" 

let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎  
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项  
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项  
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
let g:ycm_complete_in_comments=1  "在注释输入中也能补全
let g:ycm_complete_in_strings=1  "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings=1 "注释和字符串中的文字也会被收入补全
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}

" syntastic Setting
let g:syntastic_ignore_files=[".*\.py$"]    " ignore python files
let g:syntastic_check_on_open=0 
let g:syntastic_check_on_wq=1
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_cpp_compiler='clang++'    " enable syntastic support C++11 by clang
let g:syntastic_cpp_compiler_options=' -std=c++11 -stdlib=libc++'
" let g:syntastic_cpp_checkers=['gcc']    " enable syntastic support C++11 by gcc
" let g:syntastic_cpp_compiler='gcc'
" let g:syntastic_cpp_compiler_options='-std=c++11


syntax on       "开启文件类型侦测
set tags+=./tags;./.tags;
set autochdir
set nocompatible
set history=1000  "Store a ton of history (default is 20)
set showcmd     "Show partial commands in status line and Selected characters/lines in visual mode
set showmatch   " Show matching brackets/parenthesis
set ignorecase  " Case insensitive search
set smartcase   " Case sensitive when uc present
set wildmenu    " Show list instead of just completing
set wildmode=list:longest,full         " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]          " Backspace and cursor keys wrap too
set scrolljump=5                       " Lines to scroll when cursor leaves screen
set scrolloff=3                        " Minimum lines to keep above and below cursor
set foldenable                         " Auto fold code
set fileencodings=utf-8,gb18030,utf-16,big5
set termencoding=gb18030
set cindent
set autoindent
set go+=a
set incsearch   "增量式搜索
set hlsearch    "高亮搜索
set number      "显示行数标示
set shiftwidth=4   "换行时行间交错使用4个空格
set laststatus=2   "开启状态栏信息
set backspace=indent,eol,start
set clipboard+=unnamed    "与windows共享剪贴板

"设置tab和空格样式
set tabstop=4
set softtabstop=4
set smarttab
set noexpandtab
set list
set listchars=tab:\|\ ,nbsp:%,trail:-

if has("autocmd")
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
endif

"右下角显示光标位置的状态行
"set ruler

syntax enable   "打开语法高亮
set t_Co=256
colorscheme solarized

if has('gui_running')
    set background=light
else
    set background=dark
endif

highlight NoText     ctermfg=247 guifg=#a73111 cterm=bold gui=bold
highlight SpecialKey ctermfg=darkgrey  guifg=#654321
highlight Comment    ctermfg=darkgrey
highlight Constant   ctermfg=darkblue
highlight String   ctermfg=darkblue
highlight Number   ctermfg=red
highlight StatusLine cterm=bold  ctermfg=yellow ctermbg=blue

"hi link cComment Function
"hi Search ctermfg=yellow ctermbg=green
"ctermbg=lightgrey

"highlight WhitespaceEOL ctermbg=red guibg=red
"match WhitespaceEOL /\s\+$/


" 获取当前路径，将$HOME转化为~
function! CurDir()
    let curdir = getcwd()
    return curdir
endfunction
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\

""""""""""""""""""""""""""""""
" Tag list (ctags)
" """"""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglnst窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
let Tlist_File_Fold_Auto_Close=1       "非当前文件，函数列表折叠隐藏
let Tlist_Process_File_Always=0        "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0

map <silent> <F9> :TlistToggle<cr>
map <silent> <F10> :NERDTree<cr>
map <silent> <F11> :close<cr>

"""""""""""""设置开启ctags"""""""""""""     
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>


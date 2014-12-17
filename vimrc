syntax on       "�����ļ��������
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
set incsearch   "����ʽ����
set hlsearch    "��������
set number      "��ʾ������ʾ
set shiftwidth=4   "����ʱ�м佻��ʹ��4���ո�
set laststatus=2   "����״̬����Ϣ
set backspace=indent,eol,start
set clipboard+=unnamed    "��windows���������

"����tab�Ϳո���ʽ
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

"���½���ʾ���λ�õ�״̬��
"set ruler

syntax enable   "���﷨����
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


" ��ȡ��ǰ·������$HOMEת��Ϊ~
function! CurDir()
    let curdir = getcwd()
    return curdir
endfunction
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\

""""""""""""""""""""""""""""""
" Tag list (ctags)
" """"""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1            "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
let Tlist_Exit_OnlyWindow = 1          "���taglnst���������һ�����ڣ����˳�vim
let Tlist_Use_Right_Window = 1         "���Ҳര������ʾtaglist���� 
let Tlist_File_Fold_Auto_Close=1       "�ǵ�ǰ�ļ��������б��۵�����
let Tlist_Process_File_Always=0        "�Ƿ�һֱ����tags.1:����;0:����������һֱʵʱ����tags����Ϊû�б�Ҫ
let Tlist_Inc_Winwidth=0

map <silent> <F9> :TlistToggle<cr>
map <silent> <F10> :NERDTree<cr>
map <silent> <F11> :close<cr>

"""""""""""""���ÿ���ctags"""""""""""""     
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>


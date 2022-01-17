"需要环境变量: 
"	PyVim: 指向含有neovim模块的python路径
"	PlugPath: 指向插件存放路径
"设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"显示行号
set nu
set number
"突出当前行"
set cursorline
set cul
"显示括号匹配
set showmatch
"设置Tab长度为4空格
set tabstop=4
"设置自动缩进长度为4空格
set shiftwidth=4
"继承前一行的缩进方式，适用于多行注释
set autoindent
"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler
" 开启24bit颜色
set t_Co=256
"设置指定的python解释器
let g:python3_host_prog=$PyVim
"'S:\Anaconda\envs\pyvim\python.exe'
let g:python_host_prog=$PyVim
"'S:\Anaconda\envs\pyvim\python.exe'
"================================================================================
"插件
"================================================================================
call plug#begin($PlugPath)
"('S:\Neovim\share\nvim\plugged')
"状态栏
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes' " 主题
Plug 'scrooloose/nerdtree' " 好用到吐的文件浏览器
Plug 'jistr/vim-nerdtree-tabs' " 美化NerdTree
call plug#end()
"==============================================================================
" nerdtree 文件列表插件配置
"==============================================================================
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 显示行号
" let NERDTreeShowLineNumbers=1
" 设置宽度
let NERDTreeWinSize=31
" 自动打开 nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 使用 vim 而不是 vim .
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 打开任意文件启动 nerdtree 我不需要
" autocmd vimenter * NERDTree
" 打开 vim 文件及显示书签列表
" let NERDTreeShowBookmarks=2
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
"==============================================================================
" vim-airline 配置
"==============================================================================
" 启用显示缓冲区
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'

"=================================================================================
"设置快捷键
"=================================================================================
let mapleader="\<Space>"
nmap <Leader>j J
nmap J 5j
nmap K 5k
imap jk <Esc>
imap jj <C-o>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
map <Leader>tt :tabnew<cr>
map <Leader>tn :tabnext<cr>
map <Leader>tp :tabprev<cr>
map <Leader>to :tabonly<cr>
nmap <Leader>/ :noh<cr>
map <leader>r :NERDTreeFind<cr>

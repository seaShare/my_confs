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
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " markdown预览
" ↑安装该插件需要在PluginInstall之后，再输入call mkdp#util#install()命令
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
"==============================================================================
markdown-preview配置
"==============================================================================
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
"==============================================================================
"设置快捷键
"==============================================================================
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

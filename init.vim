syntax on   " 语法高亮
set number  " 显示行号
set showmatch   " 显示匹配的括号
set autoindent  " 自动缩进
set shiftwidth=4    " 自动缩进长度
set expandtab   " tab转换成空格
set tabstop=4   " 一个Tab多少个空格
set hlsearch    " 搜索高亮
set incsearch   " 支持增量搜索
set colorcolumn=80   " 设置80个字符的列边
highlight ColorColumn ctermbg=green guibg=blue
set cursorline  " 高亮当前光标行
set clipboard=unnamedplus   " 使用系统剪贴板
set mouse=nv    " Normal和Visual模式下支持鼠标


" vim plugin begin
call plug#begin("~/.vim/plugged")
Plug 'dracula/vim'  " dracule配色主题
" Plug 'preservim/nerdtree'   " 目录树结构,要配合一些开关使用 
Plug 'ryanoasis/vim-devicons'   " 开发图标
Plug 'honza/vim-snippets'   " 代码片段提示
" Plug 'preservim/nerdcommenter'  " 注释 快捷键 <Leader>ci 默认<Leadr>键是 '\'
filetype plugin on "为了支持不同语言的注释 
" Plug 'mhinz/vim-startify' " vim启动页
Plug 'vim-airline/vim-airline' " vim状态栏
Plug 'vim-airline/vim-airline-themes' " vim状态栏主题
Plug 'airblade/vim-gitgutter' " git diff
Plug 'scrooloose/syntastic' " 语法检查
" Plug 'majutsushi/tagbar' " 代码大纲预览 需要配合ctags使用
Plug 'yianwillis/vimcdoc' " 中文文档
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " 对标VSCode 替代YouCompleteMe
Plug 'gko/vim-coloresque' " 颜色预览
call plug#end()
" vim plugin end

colorscheme dracula

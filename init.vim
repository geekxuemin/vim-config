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



" 从 coc.nvim 获取的配置
set hidden " 如果不设置hidden TextEdit 可能会失败
set nobackup " 一些服务备份会失败 见 #649
set nowritebackup " 同上
set cmdheight=2 " 给显示消息设置更高高度
set updatetime=300 " 默认4000ms = 4s 较长的更新时间导致延迟和比较差的用户体验
set shortmess+=c " 不要传递消息给 |ins-completion-menu| PS: 下来研究
set signcolumn=yes " 始终显示符号栏，否则每次都会移动文本 PS: 下来研究
" 使用Tab来补全前面的或者导航的字符
" 注意: 默认情况下补全选择的条目,你可能想启用配置文件中的`"suggest.noselect":true`
" 注意: 使用命令 `:verbose imap` 确保选项卡未被映射其他插件，然后再将其放入您的配置中
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" 用<CR>也就是回车键接收选择的补全的项目或者通知coc.nvim格式化 
" <C-g>也就是用Ctrl+g撤销操作,请确认自己的选择
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 用<C-space> Ctrl-Space触发补全
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" 用`[g`和`]g`进行导航诊断
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" 代码导航跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" 使用K键在预览窗口展示文档
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" 按住光标时突出显示符号及其引用
autocmd CursorHold * silent call CocActionAsync('highlight')
" 符号重命名
nmap <leader>rn <Plug>(coc-rename)

" 格式化所选代码
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" 将代码操作应用于选定的代码块
" 例子: 当前段落的 `<leader>aap`
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" 重新映射键: 在光标位置应用代码操作
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" 重新映射键: 在整个缓冲区应用代码操作
nmap <leader>as  <Plug>(coc-codeaction-source)
" 应用首选的quickfix操作来修复当前行上的诊断
nmap <leader>qf  <Plug>(coc-fix-current)

" 重新映射键: 应用重构代码操作
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
" 在当前行运行Code Lens操作
nmap <leader>cl  <Plug>(coc-codelens-action)

" 映射函数和类文本对象
" 注意: 需要语言服务支持'textDocument.documentSymbol'
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" 重新映射: 滚动浮动窗口/弹出窗口
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" 使用Ctrl-S选择范围
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" 添加`:Format`命令格式化当前缓冲区
command! -nargs=0 Format :call CocActionAsync('format')

" 添加`:Fold`命令折叠当前缓冲区
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" 添加`:OR`命令组织当前缓冲区的imports
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" 添加 (Neo)Vim 的原生状态行支持
" 注意: 请看`:h coc-status`集成自定义状态栏的外部插件,如lightline.vim vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" CoC列表映射
" 显示所有诊断
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" 管理扩展
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" 显示命令
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" 查找当前文档的符号
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" 搜索工作区符号
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" 对下一项执行默认操作
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" 对上一项执行默认操作
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" 恢复最新的 coc 列表
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" vim plugin begin
call plug#begin("~/.vim/plugged")
Plug 'dracula/vim'  " dracule配色主题
Plug 'preservim/nerdtree'   " 目录树结构,要配合一些开关使用 
Plug 'ryanoasis/vim-devicons'   " 开发图标
Plug 'honza/vim-snippets'   " 代码片段提示
Plug 'preservim/nerdcommenter'  " 注释 快捷键 <Leader>ci 默认<Leadr>键是 '\'
filetype plugin on "为了支持不同语言的注释 
Plug 'mhinz/vim-startify' " vim启动页
Plug 'vim-airline/vim-airline' " vim状态栏
Plug 'vim-airline/vim-airline-themes' " vim状态栏主题
Plug 'airblade/vim-gitgutter' " git diff
Plug 'scrooloose/syntastic' " 语法检查
Plug 'majutsushi/tagbar' " 代码大纲预览 需要配合ctags使用
Plug 'yianwillis/vimcdoc' " 中文文档
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 对标VSCode 替代YouCompleteMe
Plug 'gko/vim-coloresque' " 颜色预览
call plug#end()
" vim plugin end

colorscheme dracula

" syntastic 语法检查官方推荐配置 begin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" syntastic 语法检查官方推荐配置 end

" youcompleteme m1 clang
let g:ycm_clangd_binary_path='/opt/homebrew/opt/llvm/bin/clangd'

" 快捷键映射
" nerdtree 打开/关闭快捷键 F5
nnoremap <F5> :exec 'NERDTreeToggle' <CR>
" tagbar
nnoremap <F8> :TagbarToggle<CR>

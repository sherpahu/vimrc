map  zx <Esc>
omap zx <Esc>
imap zx <Esc>
cmap zx <Esc>
map <F10> :NERDTreeToggle<CR>
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
"Plug 'Shougo/deoplete.nvim'
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'
" " Initialize plugin system
call plug#end()
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"deoplete
let g:deoplete#enable_at_startup = 1
set rtp+=D:/Program/cygwin64/home/hp/.vim/bundle/Vundle.vim/
call vundle#begin('/.vim/plugged')
Plugin 'VundleVim/Vundle.vim'
"Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
"Bundle 'Valloric/YouCompleteMe'
" " Initialize plugin system
call vundle#end()
"'设置编码'
let &termencoding=&encoding
set fileencodings=gbk,utf-8,gb2312,big5
"set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"'显示行号'
set nu
set number
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set showmatch
"'设置Tab长度为4空格'
set tabstop=4
"'设置自动缩进长度为4空格'
set shiftwidth=4
"'继承前一行的缩进方式，适用于多行注释'
set autoindent

set pastetoggle=<F9>
set listchars=tab:>-,trail:-
"'总是显示状态栏'
set laststatus=2
"'显示光标当前位置'
set ruler
"'让vimrc配置变更立即生效'
autocmd BufWritePost $MYVIMRC source $MYVIMRC
set autoindent                          " 自动对齐
set cindent                             " 使用C风格的缩进方案
set smartindent                         " 比autoindent稍智能的自动缩进
set softtabstop=4                       " 按退格键时可以一次删掉 4 个空格
set ts=4
set noerrorbells                                        " 关闭错误信息响铃
set novisualbell                                        " 关闭使用可视响铃代替呼叫
set vb t_vb=                                            " 当vim进行编辑时，如果命令错误，会发出警报，该设置去掉警报
set showcmd                                                     " 在状态栏显示正在输入的命令
set ruler                                                       " 在编辑过程中，在右下角显示光标位置的状态行
set showcmd                                                     " 在状态栏显示正在输入的命令
set ruler                                                       " 在编辑过程中，在右下角显示光标位置的状态行
set magic                                                       " 设置魔术,正则匹配
set ignorecase smartcase                " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set incsearch                           "输入搜索内容时就显示搜索结果
set hlsearch                            "搜索时高亮显示被找到的文本
set list lcs=tab:\|\ 
colo desert                                           " setting colors from vim
"set cmdheight=1                                                "
"设定命令行的行数为 1
"set laststatus=2                                       " 显示状态栏 (默认值为
"1, 无法显示状态栏)
"set formatoptions=rq                           " 注释格式化选项
"" setting fron fold===================================================
set foldenable                                          " 开始折叠
set foldmethod=syntax                           " 设置语法折叠
set foldlevel=100                                       " 设置折叠层数为,设置此选项为零关闭所有的折叠。更高的数字关闭更少的折叠。
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        exec "!gcc % -o %<"
        exec "! ./%<"
endfunc

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 return a:char
 elseif line[col - 1] == a:char
 return "\<Right>"
 else
 return a:char.a:char."\<Esc>i"
 endif
endfunction
set hlsearch
" 设置默认进行大小写不敏感查找
set ignorecase
" 如果有一个大写字母，则切换到大小写敏感查找
set smartcase
highlight Search ctermbg=yellow ctermfg=black
highlight IncSearch ctermbg=black ctermfg=yellow
highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>

nnoremap <c-h> :call DisableHighlight()<cr>
nnoremap <c-h> :call DisableHighlight()<cr>
function! DisableHighlight()
    set nohlsearch
endfunction
" 当光标一段时间保持不动了，就禁用高亮
autocmd cursorhold * set nohlsearch
" 当输入查找命令时，再启用高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>
set fileencoding=cp936
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1


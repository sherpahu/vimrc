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
"'���ñ���'
let &termencoding=&encoding
set fileencodings=gbk,utf-8,gb2312,big5
"set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"'��ʾ�к�'
set nu
set number
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set showmatch
"'����Tab����Ϊ4�ո�'
set tabstop=4
"'�����Զ���������Ϊ4�ո�'
set shiftwidth=4
"'�̳�ǰһ�е�������ʽ�������ڶ���ע��'
set autoindent

set pastetoggle=<F9>
set listchars=tab:>-,trail:-
"'������ʾ״̬��'
set laststatus=2
"'��ʾ��굱ǰλ��'
set ruler
"'��vimrc���ñ��������Ч'
autocmd BufWritePost $MYVIMRC source $MYVIMRC
set autoindent                          " �Զ�����
set cindent                             " ʹ��C������������
set smartindent                         " ��autoindent�����ܵ��Զ�����
set softtabstop=4                       " ���˸��ʱ����һ��ɾ�� 4 ���ո�
set ts=4
set noerrorbells                                        " �رմ�����Ϣ����
set novisualbell                                        " �ر�ʹ�ÿ�������������
set vb t_vb=                                            " ��vim���б༭ʱ�����������󣬻ᷢ��������������ȥ������
set showcmd                                                     " ��״̬����ʾ�������������
set ruler                                                       " �ڱ༭�����У������½���ʾ���λ�õ�״̬��
set showcmd                                                     " ��״̬����ʾ�������������
set ruler                                                       " �ڱ༭�����У������½���ʾ���λ�õ�״̬��
set magic                                                       " ����ħ��,����ƥ��
set ignorecase smartcase                " ����ʱ���Դ�Сд��������һ�������ϴ�д��ĸʱ�Ա��ֶԴ�Сд����
set incsearch                           "������������ʱ����ʾ�������
set hlsearch                            "����ʱ������ʾ���ҵ����ı�
set list lcs=tab:\|\ 
colo desert                                           " setting colors from vim
"set cmdheight=1                                                "
"�趨�����е�����Ϊ 1
"set laststatus=2                                       " ��ʾ״̬�� (Ĭ��ֵΪ
"1, �޷���ʾ״̬��)
"set formatoptions=rq                           " ע�͸�ʽ��ѡ��
"" setting fron fold===================================================
set foldenable                                          " ��ʼ�۵�
set foldmethod=syntax                           " �����﷨�۵�
set foldlevel=100                                       " �����۵�����Ϊ,���ô�ѡ��Ϊ��ر����е��۵������ߵ����ֹرո��ٵ��۵���
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
" ����Ĭ�Ͻ��д�Сд�����в���
set ignorecase
" �����һ����д��ĸ�����л�����Сд���в���
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
" �����һ��ʱ�䱣�ֲ����ˣ��ͽ��ø���
autocmd cursorhold * set nohlsearch
" �������������ʱ�������ø���
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>
set fileencoding=cp936
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1


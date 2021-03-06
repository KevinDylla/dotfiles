set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" If installed using git
set rtp+=~/.fzf
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
"Plugin 'valloric/matchtagalways'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tpope/vim-markdown'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'chrisbra/colorizer'
Plugin 'mattn/emmet-vim'
Plugin 'easymotion/vim-easymotion'
"Plugin 'yggdroot/indentline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'tomasiser/vim-code-dark'
Plugin 'airblade/vim-gitgutter'
Plugin 'neomake/neomake'
Plugin 'christoomey/vim-system-copy'
Plugin 'wikitopian/hardmode'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'chriskempson/base16-vim'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'gregsexton/gitv'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"
" all of your plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sets how many lines of history vim has to remember
set history=500
set rtp+=~/.fzf
" enable filetype plugins
"Easy saving
inoremap <C-s> <Esc>:w!<Enter>i
nnoremap <C-s> :w!<Enter>
"Source ~/.vimrc
nnoremap ;lrc :source $MYVIMRC<cr>
set relativenumber
nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap ß $
filetype plugin on
filetype indent on
set autoread
" with a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "ö"
let g:mapleader = "ö"
autocmd stdinreadpre * let s:std_in=1

let g:LatexBox_latexmk_options = "-pvc -pdfps"
let g:Tex_CompileRule_pdf = 'latexmk -pdf'

" fast saving
nmap <leader>w :w!<cr>

let g:ycm_python_binary_path = '/usr/bin/python3'

set bg=dark   
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

" avoid garbled characters in chinese language windows os
let $lang='en' 
set langmenu=en


"always show current position
set ruler

" a buffer becomes hidden when it is abandoned
set hid

" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" ignore case when searching
set ignorecase

" when searching try to be smart about cases 
set smartcase

" highlight search results
set hlsearch

" makes search act like search in modern browsers
set incsearch 

" don't redraw while executing macros (good performance config)
set lazyredraw 

" for regular expressions turn magic on
set magic

" show matching brackets when text indicator is over them
set showmatch 

" how many tenths of a second to blink when matching brackets
set mat=2

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable syntax highlighting
syntax enable 
""""""" GruvBox""""""
" colorscheme PaperColor
"colorscheme grb256
colorscheme codedark

" set utf8 as standard encoding and en_us as the standard language
set encoding=utf8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turn backup off, since most stuff is in svn, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use spaces instead of tabs
set expandtab

" be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" linebreak on 500 characters
set lbr
set tw=500

set ai "auto indent
set si "smart indent
set wrap "wrap lines


""""""""""""""""""""""""""""""
" => visual mode related
""""""""""""""""""""""""""""""
" visual mode pressing * or # searches for the current selection
" super useful! from an idea by michael naumann
vnoremap <silent> * :<c-u>call visualselection('', '')<cr>/<c-r>=@/<cr><cr>
vnoremap <silent> # :<c-u>call visualselection('', '')<cr>?<c-r>=@/<cr><cr>

" smart way to move between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" close the current buffer
map <leader>bd :bclose<cr>:tabclose<cr>gt

" close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<cr>
au tableave * let g:lasttab = tabpagenr()


" opens a new tab with the current buffer's path
" super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/


""""""""""""""""""""""""""""""
" => status line
""""""""""""""""""""""""""""""
" always show the status line
set laststatus=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remap vim 0 to first non-blank character
map 0 ^



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


" make vim remember position in file after reopen
if has("autocmd")
au bufreadpost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
noremap <c-c> :set paste<cr> 
noremap <c-n> :FZF<cr> 

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='codedark'
" let g:livepreview_previewer = 'zathura'

" keine pfeiltasten
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>


cmap w!! w !sudo tee % > /dev/null
nnoremap tn :tabnew<space>
nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap th :tabfirst<cr>
nnoremap tl :tablast<cr>

let g:easymotion_do_mapping = 0 " disable default mappings

" jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap ü <plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" need one more keystroke, but on average, it may be more comfortable.
nmap ü <plug>(easymotion-overwin-f2)

" turn on case insensitive feature
let g:easymotion_smartcase = 1

" jk motions: line motions
map <leader>j <plug>(easymotion-j)
map <leader>k <plug>(easymotion-k)
" define keyword.
"Move around with Guide (<++>)
inoremap <space><space> <esc>/<++><enter>"_c4l
vnoremap <space><space> <esc>/<++><enter>"_c4l
nnoremap <space><space> <esc>/<++><enter>"_c4l
map <space><space> <esc>/<++><enter>"_c4l

nnoremap ;gui i<++><esc>
inoremap ;gui <++>
"ersetzt space space , wenn gebraucht
inoremap <C-l> <Space><Space>
"auto vervollstandigen 
"html
autocmd FileType html nnoremap ;p i<p></p><space><++><esc>FpT>i
autocmd FileType html nnoremap ;b i<b></b><++><esc>FbT>i
autocmd FileType html nnoremap ;em i<em></em><++><esc>FeT>i
autocmd FileType html inoremap ;p <p></p><++><esc>FpT>i
autocmd FileType html inoremap ;b <b></b><++><esc>FbT>i
autocmd FileType html inoremap ;em <em></em><++><esc>FeT>i
autocmd FileType html inoremap ;n <br>
autocmd FileType html nnoremap ;n i<br><esc> 
autocmd FileType html nnoremap ;css i<link rel="stylesheet" type="text/css" href="<++>"><esc> 
autocmd FileType html inoremap ;css <link rel="stylesheet" type="text/css" href="<++>"> 
autocmd FileType html nnoremap ;1 i<h1></h1><++><esc>FhT>i
autocmd FileType html inoremap ;1 <h1></h1><++><esc>FhT>i
autocmd FileType html nnoremap ;2 i<h2></h2><++><esc>FhT>i
autocmd FileType html inoremap ;2 <h2></h2><++><esc>FhT>i
autocmd FileType html nnoremap ;a i<a href=""><++></a><space><++><esc>F"i
autocmd FileType html inoremap ;a <a href=""><++></a><space><++><esc>F"i
" Jump between HTML Tags , with NO content
autocmd FileType html inoremap ;it <esc>vit<esc>i
autocmd FileType html nnoremap ;it vit<esc>i
"Change within tag (HTML) ~< Test
nnoremap ;ct vitc
inoremap ;ct <esc>vitc


" Markdown Settings

autocmd FileType markdown nnoremap ;b i**<++>**<esc>
autocmd FileType markdown inoremap ;b **<++>** 
autocmd FileType markdown nnoremap ;i i_<++>_<esc> 
autocmd FileType markdown inoremap ;i _<++>_ 

"LaTeX Settings
autocmd FileType tex nnoremap ;b i\textbf{}<esc>Ff2li
autocmd FileType tex inoremap ;b \textbf{}<esc>Ff2li

autocmd FileType tex nnoremap ;i i\emph{}<esc>Fh2li
autocmd FileType tex inoremap ;i \emph{}<esc>Fh2li

autocmd FileType tex nnoremap ;s i\section{}<esc>Fn2li
autocmd FileType tex inoremap ;s \section{}<esc>Fn2li

autocmd FileType tex nnoremap ;ss i\subsection{}<esc>Fn2li
autocmd FileType tex inoremap ;ss \subsection{}<esc>Fn2li

autocmd FileType tex nnoremap ;sss i\subsubsection{}<esc>Fn2li
autocmd FileType tex inoremap ;sss \subsubsection{}<esc>Fn2li

autocmd FileType tex nnoremap ;ti i<return>\title{<++>}<return>\author{Kevin Dylla}<return>\maketitle<return>
autocmd FileType tex inoremap ;ti i<return>\title{<++>}<return>\author{Kevin Dylla}<return>\maketitle<return>

autocmd FileType tex nnoremap <C-k> :w<Enter>:!(setsid<Space>pdflatex<Space><C-R>%<Space>&><space>/dev/null&)<Enter><Enter>   

autocmd FileType tex nnoremap <C-o> :!<Space>setsid<Space>evince<Space><C-R>%<Backspace><Backspace><Backspace>pdf<Space>&><Space>/dev/null<Space>&<Enter><Enter>
"latex settings
"
set grepprg=grep\ -nh\ $*
let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat='pdf'
"Umlaute [Test]
autocmd FileType tex inoremap ä "{a}
autocmd FileType tex inoremap Ä "{A}
autocmd FileType tex inoremap ü "{u}
autocmd FileType tex inoremap Ü "{U}
autocmd FileType tex inoremap ö "{o}
autocmd FileType tex inoremap Ö "{O}
autocmd FileType tex inoremap ß \ss{}


let g:system_copy#paste_command='xclip -sel clipboard -o'
let g:system_copy#copy_command='xclip -sel clipboard'

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

tnoremap <F12> <C-\><C-n> 


nmap j gj
nmap k gk


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
highlight LineNr ctermfg=red
set cursorline

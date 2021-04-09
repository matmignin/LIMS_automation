
syntax enable
autocmd BufEnter *.yml hi Normal ctermbg=54
autocmd BufEnter *.conf hi Normal ctermbg=10
autocmd BufEnter *.py hi Normal ctermbg=52
autocmd BufEnter *.tf hi Normal ctermbg=22
autocmd BufEnter .* hi Normal ctermbg=236
autocmd BufEnter *.sh hi Normal ctermbg=236
autocmd BufEnter *.zsh hi Normal ctermbg=236
autocmd BufEnter *.txt hi Normal ctermbg=94
autocmd BufEnter *.cfg hi Normal ctermbg=58


hi TabLine    gui=NONE guibg=#3e4452 guifg=#abb2bf    cterm=NONE term=NONE ctermfg=red ctermbg=white
"colorscheme wonka-light 
"set background="#1a3922"
 "enable indentation
set breakindent
" ident by an additional 2 characters on wrapped lines, when line >= 40 characters, put 'showbreak' at start of line
set breakindentopt=shift:1,min:40,sbr
" append '' to indent
set showbreak=|      
"set encoding=utf-8
set hlsearch
set noshowmode
syntax on
let mapleader = " "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{FugitiveStatusline()}
set statusline+=%*
hi statusline guibg=White ctermfg=8 guifg=Blue ctermbg=15
let python_highlight_all = 1
set number relativenumber
set nu rnu
set number
set lbr
"set expandtab
"set tabstop=2
"set softtabstop=1
"set shiftwidth=2
filetype plugin on
set backspace=indent,eol,start 
set clipboard=unnamed
set incsearch
set ignorecase
set splitbelow
set noswapfile
set foldlevel=99
autocmd FileType python set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set textwidth=79
set expandtab
set autoindent
set fileformat=unix
set timeoutlen=300
set ttimeoutlen=300
set splitright

hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=NONE guibg=NONE 
 "set hlsearch
        
nnoremap <leader>/ <esc>:set hlsearch! <cr>
vnoremap <leader>/ <esc>:set hlsearch! <cr> <bar> gv
" disable x and d from going to clipboard 
xnoremap x "_x
"xnoremap d "_d
nnoremap x "_x
nnoremap dw "_dw
xnoremap dw "_dw
nnoremap <f9> :x<cr>
"nmap qq :q!<cr>
nmap Q :q<cr>
inoremap <c-q> <esc>:q!<cr>
inoremap <c-x> <esc>:x<cr>
nnoremap <C-x> :x<cr>
nnoremap Qq :qa<cr>; :qa<cr>
noremap U <c-r>
noremap J 10j
noremap K 10k
noremap Q :q<cr>
noremap 11 @1
noremap 22 @2
noremap 33 @3
nnoremap 123 :set nu! rnu!<cr>
nmap t gt
nmap T gT
nmap <leader>t :tabedit .<cr>
nnoremap ttt :tabedit 




nmap <CR> o<Esc>
nnoremap <leader>a :call fugitive_-<cr>



" split navigation
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
"nmap <C-^> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>
nnoremap <leader>h :vsplit .<cr>
nnoremap _ :split .<cr>
nnoremap <leader>j :split .<cr>
nnoremap \| :vsplit .<cr>
nnoremap <leader>; <C-W>R<cr>
nnoremap <F5> <C-W>q<cr>
nnoremap <leader>w :x<cr>
nnoremap X :x<cr>
nnoremap <leader>q <C-W>q!<cr>
nnoremap Q :qa!<cr>
nnoremap <F7> :res +1<cr>
nnoremap <F8> :res -1<cr>
nnoremap <F9> :vertical resize +1<cr>
nnoremap <F6> :vertical resize -1<cr>

inoremap jk <esc>
inoremap <F13> <esc>
nnoremap <F13> <esc>
"inoremap <S-F13> <C-P>



nn <leader>q :if ((len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1) && expand('%') == '')<Bar>exe 'q'<Bar>else<Bar>endif<cr>


noremap <leader>1  :hi Normal ctermbg=17<cr>
noremap <leader>2  :hi Normal ctermbg=17<cr>
noremap <leader>3  :hi Normal ctermbg=22<cr> 
noremap <leader>4  :hi Normal ctermbg=88<cr>
noremap <leader>5  :hi Normal ctermbg=16<cr>
noremap <leader>6  :hi Normal ctermbg=94<cr>

" phone terminal
inoremap ° <esc>:w<cr>a
nnoremap ° :w<cr>
nnoremap × dd<cr>
"nnoremap ÷ yy<cr>
nnoremap ∞ :x<cr>
inoremap ∞ <esc>:x<cr>
inoremap • <esc>
vnoremap • <esc>

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap 》 <C-W><C-L>
nmap 《 <C-W><C-H>
nnoremap ≤ :vsplit ~/.vimrc<cr>
nnoremap ≥ :w<CR>; :source ~/.vimrc<CR>; <CR>
"nnoremap 》 e
"nnoremap 》 <esc>
"inoremap 》 e
"nnoremap ^ k
"inoremap ÷ <esc>
"vnoremap ^ k
"nnoremap《 b
"inoremap《 <esc>
"vnoremap《 b
nmap ÷ :set cursorline!<cr>
"nnoremap \| k
:vmap ya "ay
:vmap y1 "1y
:vmap y2 "2y
:vmap y3 "3y


:nmap ya "ayy
:nmap y1 "1yy
:nmap y2 "2yy
:nmap y3 "3yy

:nmap pa "ap
:nmap p1 "1p
:nmap p2 "2p
:nmap p3 "3p
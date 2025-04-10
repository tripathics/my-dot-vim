" ==> Plugins
" TODO: Ensure vim plug is there

call plug#begin('~/.vim/plugged')
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'preservim/nerdtree'
	Plug 'jlanzarotta/bufexplorer'
	Plug 'tpope/vim-fugitive'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'NLKNguyen/papercolor-theme'
call plug#end()

" ==================> Set keybindings
let mapleader = "\<space>"

" Use <-> to open the current file directory
" nnoremap - :Ex <c-r>=expand('%:h')<cr><cr>

noremap <c-j> <c-w>j	" Movement between windows
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" ==> Looks

set number " Hybrid line numbers
set relativenumber

syntax on " Colors
set hlsearch

set wildmenu	" Wildmenu
set wildmode=list:longest,full
set wildoptions=pum

" Use 2 space tabs
set tabstop=2
set shiftwidth=2
set noexpandtab

" colorscheme
set background=dark
colorscheme PaperColor

" ==> Plugin customizations

" Nerdtree
noremap <leader>e :NERDTreeToggle<cr>

" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'

" Bufexplorer
noremap <leader>o :BufExplorer<cr>

" Airline theme
let g:airline_powerline_fonts = 1

" coc
set encoding=utf-8
set signcolumn=yes

" suggestions accept with tab
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()

" use <c-space> for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" Use <C-@> on vim
inoremap <silent><expr> <c-@> coc#refresh()
" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

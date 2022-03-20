" Basic configuration {{{
syntax on
set number
set noswapfile
set hlsearch
set ignorecase
set incsearch
set tabstop=2
set shiftwidth=2
set expandtab
set timeoutlen=300
set foldlevelstart=0

" specifically for coc
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300

set shortmess+=c
" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" Some vim accessories
Plug 'vim-airline/vim-airline'

call plug#end()
" }}}

" Theme settings {{{
set t_Co=256
syntax on
colorscheme nord 

" }}}

" Key mapping {{{
let mapleader = ","

inoremap <c-d> <esc>ddi
inoremap jk <esc>
vnoremap jk <esc>
inoremap <esc> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

nnoremap <leader>a :CocAction<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>s :w<cr>
inoremap <leader>s <esc>:w<cr>
nnoremap <leader>q :bd<cr>

nnoremap <leader>fi :Rg!<cr>
nnoremap <silent><leader>b :Explore<CR>

nnoremap <silent><leader>rl :source $MYVIMRC<CR>

" Copy from buffer to system clipboard
nnoremap <leader>yy "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+p
vnoremap <leader>p "+p
vnoremap <leader>P "+p
" }}}

" Coc key binding {{{ 
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent><leader>e :CocCommand flutter.dev.openDevLog<CR>
nnoremap <silent><leader>r :CocCommand flutter.dev.hotRestart<CR>
nnoremap <silent><leader>R :CocCommand flutter.run<CR>
nnoremap <silent><leader>C :CocCommand flutter.dev.clearDevLog<CR>
nnoremap <silent><leader>dv :CocList FlutterDevices<CR>
" }}}

" Coc global libs {{{
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-emmet',
  \ 'coc-prettier',
  \ 'coc-flutter',
  \ 'coc-yaml',
  \ 'coc-snippets',
  \ ]
" }}}

" Coc functions {{{
" Use K to show documentation in preview window
nnoremap <leader>gk :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Coc settings - <tab> for completion {{{
	inoremap <silent><expr> <TAB>
	  \ pumvisible() ? coc#_select_confirm() :
	  \ coc#expandableOrJumpable() ?
	  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
	let g:coc_snippet_next = '<tab>'
" }}}

" Vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


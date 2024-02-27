
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}  | Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-scripts/fountain.vim' | Plug 'tpope/vim-markdown' | Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
call plug#end()

"General Settings
set encoding=UTF-8 nobackup nowritebackup nocursorline splitbelow nu rnu wildmode=longest,list,full
set shiftwidth=2 autoindent smartindent tabstop=2 softtabstop=2 expandtab
au BufRead,BufNewFile *.fountian set filetype=fountain

"Status Line
set statusline=
set statusline+=%#DiffAdd#
set statusline+=\ %f
set statusline+=%=
set statusline+=%#TermCursor#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=\ %l/%L
set statusline+=\ [%c]

"Key-bindings
let mapleader=" "
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
nnoremap <leader><ENTER> :Goyo<CR>
nnoremap <leader><SPACE> :CtrlP<CR>
nnoremap <leader>n :Lex<CR>
nnoremap <leader><C-l> :set nofoldenable<CR>
nnoremap <C-l> :set foldmethod=indent<CR>
nnoremap <C-k> :set foldmethod=syntax<CR>

nnoremap Q <nop>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

"Color Settings
colorscheme gruvbox
set background=dark
set termguicolors
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guifg=NONE ctermfg=NONE

"Goyo Settings
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  hi! Normal ctermbg=NONE guibg=NONE
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()



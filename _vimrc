" Leader key
let mapleader=","

if !exists("g:syntax_on")
    syntax enable
endif
filetype off
colorscheme solarized
set clipboard=unnamed
set nocompatible
set laststatus=2
set t_Co=256
set background=dark
set number
set backspace=2
set lazyredraw
set encoding=utf-8

set backupdir=~/.vim/vimtmp,.
set directory=~/.vim/vimtmp,.

" Stop auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Buffer listing
nmap <Space> :Buffers<CR>

" Highlighting
set hlsearch
map <silent> <Leader>h :noh<cr>

" vim-maximizer
nmap <Leader>m :MaximizerToggle<CR>

" tmux-like splitting
nmap <Leader>% :vs<CR>
nmap <Leader>" :sp<CR>

" Esc
imap jk <Esc>

" Buffer navigation
nmap <Leader>bp :bprevious<CR>
nmap <Leader>bn :bnext<CR>

" Display extra whitespace
"set list listchars=tab:»·,trail:·,nbsp:·

" ================ Scrolling ========================

"set scrolloff=8         "Start scrolling when we're 8 lines away from margins
"set sidescrolloff=15
"set sidescroll=1

" Make it obvious where 100 characters is
set textwidth=100
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>r :call RunNearestSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>
" let g:rspec_runner = "os_x_iterm2"
" let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
let test#strategy="tslime"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" tslime.vim
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Spaces instead of tabs
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Auto-indentation
set autoindent
set smartindent

" Remove whitespaces on write
autocmd BufWritePre * :%s/\s\+$//e

" Breaking the habit
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#format = 1

" vim-airline-themes
let g:airline_theme='solarized'

" NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key='<F5>'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

" fzf
nmap <silent> <C-p> :Files <CR>
" :vimgrep /initialStatusEdit/ **/*
nmap <silent> <leader>p :cprev <CR>
nmap <silent> <leader>n :cnext <CR>
" :%s/pattern/replace/gc

" Set custom syntax highlighting
au BufNewFile,BufRead *.monitrc setlocal syntax=monitrc

" highlight cursor line
":set cursorline

" hybrid line numbers
":set number relativenumber

":augroup numbertoggle
":  autocmd!
":  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
":  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
":augroup END

" Debuggers
function! AddDebug()
  let extension = expand('%:e')

  if (extension == 'ex' || extension == 'exs')
    call append('.', 'require IEx; IEx.pry')
  elseif (extension == 'rb')
    call append('.', 'require "pry"; binding.pry')
  elseif (extension == 'py')
    call append('.', 'import pdb; pdb.set_trace()')
  endif
endfunction

nmap <silent> <Leader>p :call AddDebug()<CR>

" Vundleh
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Set the runtime path to include Vundle and initialize
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ajh17/VimCompletesMe'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'nono/vim-handlebars'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-haml'
" Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'szw/vim-maximizer'
Plugin 'elixir-lang/vim-elixir'
Plugin 'qpkorr/vim-renamer'
Plugin 'tmatilai/vim-monit'
Plugin 'godlygeek/tabular'
Plugin 'lejboua/vim-test'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Konfekt/FastFold'
" Plugin 'kchmck/vim-coffee-script'
" SOON...
" Plugin 'hallettj/jslint.vim'
" Plugin 'tpope/vim-surround'
"
" All of your Plugins must be added before the following line
call vundle#end()
syntax on
filetype plugin indent on


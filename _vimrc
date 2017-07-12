" Leader key
let mapleader=","

syntax enable
filetype off
colorscheme solarized
set nocompatible
set laststatus=2
set t_Co=256
set background=dark
set number
set backspace=2

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 100 characters is
set textwidth=100
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

"Toggle relative numbering, and set to absolute on loss of focus or insert
"mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" Stop auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Buffer listing
nmap <Space> :CtrlPBuffer<CR>

" Highlighting
set hlsearch
map <silent> <Leader>h :noh<cr>

" vim-maximizer
nmap <Leader>m :MaximizerToggle<CR>

" tmux-like splitting
nmap <Leader>\ :vs<CR>
nmap <Leader>- :sp<CR>

" Ruby pry debugger
nmap <Leader>p require "pry"; binding.pry <Esc>

" Buffer navigation
nmap <Leader>bp :bprevious<CR>
nmap <Leader>bn :bnext<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>r :call RunNearestSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'

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

" esc
imap jk <Esc>

" Remove whitespaces on write
autocmd BufWritePre * :%s/\s\+$//e

" Breaking the habit
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#format = 1

" vim-airline-themes
let g:airline_theme='solarized'

" NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key='<F5>'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore "**/*.pyc"
  \ --ignore node_modules'
let g:ag_prg='ag --nocolor --nogroup --column
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore "**/*.pyc"
  \ --ignore node_modules'

" Set custom syntax highlighting
au BufNewFile,BufRead *.monitrc setlocal syntax=monitrc

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Set the runtime path to include Vundle and initialize
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ajh17/VimCompletesMe'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'nono/vim-handlebars'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'szw/vim-maximizer'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'elixir-lang/vim-elixir'
Plugin 'qpkorr/vim-renamer'
Plugin 'tmatilai/vim-monit'
Plugin 'godlygeek/tabular'
Plugin 'lejboua/vim-test'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on


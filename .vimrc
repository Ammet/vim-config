" ------------------
" Plugins list for Vundle
" ------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-commentary'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'ngmy/vim-rubocop'
Plugin 'mileszs/ack.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-bundler'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-scripts/Solarized'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jgdavey/tslime.vim'
Plugin 'jpo/vim-railscasts-theme'
call vundle#end()            " required
filetype plugin indent on
" --------------------
" PACKAGES
" --------------------
" airLine
set laststatus=2
let g:airline_theme = 'bubblegum'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline#extensions#syntastic#enabled = 1
let g:airline_section_b = "%f%m"
let g:airline_section_c = "%{fugitive#head()}" "display git branch
let g:airline_section_z = '%{strftime("%H:%M")}'
" ctrlp
" use silver_searcher for lookup
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_custom_ignore = 'bower_components\|DS_Store\|git\|node_modules'
let g:ctrlp_use_caching = 0
set timeoutlen=500 " reduce wait time for amigigous chars
" only check syntax on write
let JSHintUpdateWriteOnly = 1
" silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_slim_checkers = ['slim_lint']
let g:syntastic_javascript_checkers = []
" rspec
" let g:tslime_always_current_session = 1
" let g:tslime_always_current_window = 1
" let g:rspec_command = "VtrSendCommandToRunner! rspec {spec}"
" let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" -------------------
"  APPEARANCE
" --------------------
syntax on
let g:solarized_termtrans=1
let g:solarized_termcolors=256
set background=dark
colorscheme Tomorrow-Night-Eighties
" make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=235 guibg=#2c2d27
" set the line number colum color
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" set the statusline colors
hi StatusLine                  ctermfg=8     ctermbg=2     cterm=NONE
hi StatusLineNC                ctermfg=2     ctermbg=8     cterm=NONE
" --------------------
" CONFIG
" --------------------
" Save file and exit insert mode
imap <leader>. <esc>:w<cr>
imap .<leader> <esc>:w<cr>
" Key bind to escape the insert mode
imap jk <esc>
imap kj <esc>
set scrolloff=4 " Keeping 4 lines below the cursor
let g:bufferline_echo = 0 " don't show standard budder
" disable the arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Simpler navigartion between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Open new windows on right and below
set splitbelow
set splitright
" Aliases for typos
command! Q q " Bind :Q to :q
command! W w
command! Wq wq
command! WQ wq
command! E e
" map semi-colon to colon
nnoremap <Leader>; ;
nnoremap ; :
filetype on " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins
set autoindent
set backspace=indent,eol,start " backspace for dummys
set backupdir=/tmp/
set directory=/tmp " don't clutter my dirs up with swp and tmp files
set et|retab
set encoding=utf-8
set expandtab
set grepprg=ag " use sliver_searcher instead of grep
set gdefault " assume the /g flag on :s substitutions to replace all matches
set incsearch
set laststatus=2  " always show status line.
set list " use :set list! to toggle visible whitespace on/off
set listchars=nbsp:¬,tab:>-,trail:•,extends:➮
set modeline " bash-like filenames completion
set noerrorbells " disable vim error noise
set noshowmode "hide default vim mode
set nocompatible
set number
set relativenumber
set ruler
set shiftwidth=2
set smartcase " searching
set smarttab
set tabstop=2
set wildignore+=tmp/** " ignore stuff that can't be opened
set wildmode=longest,full
set wildmenu
" Triming whitespaces
autocmd BufWritePre * %s/\s\+$//e
" --------------------
" GIT
" --------------------
autocmd Filetype gitcommit setlocal spell textwidth=72 " format commit
" --------------------
" MAPPINGS
" --------------------
let mapleader = ","
" navigate displayed lines rather than physical lines
noremap j gj
noremap k gk
nmap <Leader>' ysiw'
nmap <Leader>c :Commentary<cr>
" vim-tmux-runner
nnoremap <Leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>
nnoremap <Leader>sf :VtrSendFile<cr>
nnoremap <Leader>sl :VtrSendLinesToRunner<cr>
map <Leader>a :call RunAllSpecs()<cr>
map <Leader>bb :!bundle install<cr>
map <Leader>f :Ack<space>
map <Leader>fc :Ack <C-R><C-W><cr>
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>
map <Leader>l :call RunLastSpec()<cr>
map <Leader>q :copen<cr>
map <Leader>p :set paste<cr><esc>"*]p:set nopaste<cr>
map <Leader>ra :%s/
map <Leader>s :call RunNearestSpec()<cr>
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>t :call RunCurrentSpecFile()<cr>
map <Leader>u :Eunittest<cr>
map <Leader>v :vsp<cr>
map <Leader>vi :tabe ~/.vimrc<cr>
map <Leader>ti :tabe ~/.tmux.conf<cr>
" My Custom shortcuts
map <Leader>cm :!git add . && git commit -v<cr>
map <Leader>sq :wq<cr>
map <Leader>dbm :!clear; bundle exec rake db:migrate<cr>
map <Leader>dbr :!clear; bundle exec rake db:rollback<cr>
map <Leader>so :source $MYVIMRC<cr>
vmap <Leader>y :w !pbcopy<cr><cr>
" Reset test database if it is poluted
map <Leader>tr :!RAILS_ENV=test bundle exec rake db:reset<cr>
" rename current file - thanks Gary Bernhardt
function! RenameFile()
	let old_name = expand('%')
	let new_name = input('New file name: ', expand('%'), 'file')
	if new_name != '' && new_name != old_name
		exec ':saveas ' . new_name
		exec ':silent !rm ' . old_name
		redraw!
	endif
endfunction
map <Leader>n :call RenameFile()<,r>

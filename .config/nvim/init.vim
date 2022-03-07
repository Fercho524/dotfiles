"******************************************************************
"         PLUGINS
"******************************************************************

" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

" Help for brakets, parentheses and similars
Plug 'tpope/vim-surround'

" Sudo writing from my own vim
Plug 'tpope/vim-eunuch'
Plug 'elkowar/yuck.vim'
" Fileexplorer
Plug 'scrooloose/nerdtree' 
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Themes
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'dylanaraps/wal.vim'
Plug 'joshdick/onedark.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'ayu-theme/ayu-vim'

" Bottom and tab bars
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Appareance
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/Colorizer'
Plug 'ap/vim-css-color'
Plug 'frazrepo/vim-rainbow'

" Writing help and autocomplete 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
"Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim'

call plug#end()

"******************************************************************
"         PLUGIN SETTINGS 
"******************************************************************

" File Explorer (ctrl+ww between editor and file explorer)
let g:NERDTreeChDirMode = 1  
map <F2> :NERDTreeToggle<CR> 

" Airline settings
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
let g:airline_powerline_fonts = 1 " Cargar fuente Powerline y símbolos (ver nota)
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

" IDENTLINE  No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['term:.*']
let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='css,html'

" SUPERTAB
let g:SuperTabDefaultCompletionType = '<c-n>'
" Rainbow tags (){}<>
let g:rainbow_active = 1
au FileType c,cpp,objc,objcpp call rainbow#load()

" Emmet autocomplete C+y+, for complete html
let g:user_emmet_mode='inv' 

" AUTOCOMPLETADO
set complete-=t
set complete-=i

"******************************************************************
"         EDITOR SETTINGS
"******************************************************************

" Show titt	on terminal window
set title  

" Line number
set number 
set relativenumber

" Mouse integration
set mouse=a  
set nowrap  
"set cursorline
set colorcolumn=120  

" Indentación a 2 espacios
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround 

" Exchange between buffers without saving
set hidden  
set smartcase  

" THEMES SETTINGS
let g:shades_of_purple_airline = 0
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let ayucolor="mirage" " available: mirage,light,dark

set background=light 
"set termguicolors " Comment if you use pywal
syntax enable
colorscheme wal

"******************************************************************
"         KEYBINGINGS
"******************************************************************

" Quick controls
nnoremap <C-s> :w<CR>	"save
nnoremap <C-q> :Bclose<CR> "quit and save

" Move between your openned buffers
nnoremap <Tab> :bnext<CR> 
nnoremap <S-Tab> :bprev<CR>

" Close neovim
nnoremap <C-x> :wq!<CR>

" New key for emmet autocomplete
let g:user_emmet_leader_key='<C-Z>'

" Ranger Config
nnoremap <C-o> :RangerCurrentDirectory<CR> 

" Rezize Windows
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

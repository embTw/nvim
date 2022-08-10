"                        _                    
"  _ __ ___  _   ___   _(_)_ __ ___  _ __ ___ 
" | '_ ` _ \| | | \ \ / / | '_ ` _ \| '__/ __|
" | | | | | | |_| |\ V /| | | | | | | | | (__ 
" |_| |_| |_|\__, | \_/ |_|_| |_| |_|_|  \___|
"            |___/                            
" Author: @cyt
" ==================== Auto load for first time uses ====================
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" ==================== Editor behavior ====================
"set clipboard=unnamedplus
let &t_ut=''
set autochdir
set exrc
set secure
set number
"set relativenumber
set cursorline
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
" set list
" set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set timeoutlen=250
set ttimeoutlen=0
" set viewoptions=cursor,folds,slash,unix
set wrap
set foldmethod=indent	" 缩进折叠
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set showmode
set showcmd
set ignorecase
set smartcase
" set shortmess+=c
" set inccommand=split		" :s替换时独立窗口显示
set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw
set visualbell
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
" set colorcolumn=100		" 展示一条线来指示一行的最大长度
set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ==================== Basic Mappings ====================
let mapleader=","
nnoremap <leader>d dd
nnoremap <leader>c cc
nnoremap <leader>q :q!<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>l :source $MYVIMRC<cr>
nnoremap <leader>e :e $MYVIMRC<cr>
nnoremap <leader>o o<esc>
nnoremap <c-e> 3<c-e>
nnoremap <c-y> 3<c-y>
nnoremap <leader>v <c-v>
nnoremap <space>p "0p<esc>
nnoremap <tab> >>
nnoremap <s-tab> <<
vnoremap <tab> >
vnoremap <s-tab> <

" ==================== Cursor Movement ====================
noremap J 3j
noremap K 3k
noremap W 3w
noremap B 3b
noremap H ^
noremap L $

" ==================== Insert Mode Cursor Movement ====================
inoremap <c-l> <c-o>l

" ===
" === Install Plugins with Vim-Plug
" ===
call plug#begin('$HOME/.config/nvim/plugged')
Plug 'aonemd/quietlight.vim'	" 主题
Plug 'tomtom/tcomment_vim'  	" 注释， 使用gcc注释一行
Plug 'haya14busa/is.vim'    	" 解决搜索高亮问题并提升搜索
Plug 'famiu/bufdelete.nvim'		" 实现类似于:bd的功能并保存布局
Plug 'neoclide/coc.nvim', {'branch': 'release'}	" 一个能装插件的插件👍
call plug#end()

" ===
" === quietlight plugins config
" ===
	set termguicolors " enable true colors support
	set t_Co=256
	set background=light
	colorscheme quietlight

" ===
" ===  bufdelete
" ===
	nnoremap <leader>x :Bdelete<cr>

" ===
" ===  coc.nvim
" ===
	let g:coc_global_extensions = [
				\'coc-explorer',
				\'coc-vimlsp']
	inoremap <silent><expr> <TAB>
		  \ coc#pum#visible() ? coc#pum#next(1):
		  \ CheckBackspace() ? "\<Tab>" :
		  \ coc#refresh()
	inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
								  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

	function! CheckBackspace() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	"show document in preview window
	nnoremap <silent> <space>h :call ShowDocumentation()<CR>	" 查看帮助文档
	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

	function! ShowDocumentation()
	  if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	  else
		call feedkeys('K', 'in')
	  endif
	endfunction

" ===
" === coc plugins config
" ===
" coc-explorer
	nnoremap <space>e <Cmd>CocCommand explorer<CR>



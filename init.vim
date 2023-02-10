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
set clipboard=unnamedplus
set mouse=nv
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
set timeoutlen=300
set ttimeoutlen=0
" set viewoptions=cursor,folds,slash,unix
set wrap
set foldmethod=syntax	" 缩进折叠
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
set updatetime=200
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
nnoremap <leader>r :!
nnoremap <c-a> ggVG
nnoremap <c-e> 3<c-e>
nnoremap <c-y> 3<c-y>
nnoremap <c-k> K
nnoremap <space>y ggVG"+y<c-o>:echo "文件内容复制成功"<cr>zz
nnoremap <leader>v <c-v>
nnoremap <space>p "0p<esc>
nnoremap > >>
nnoremap < <<
vnoremap <c-c> "+y     " 方便复制到系统剪切板
vnoremap <c-v> "+p     
cnoremap <c-j> <down>
cnoremap <c-k> <up>

" ==================== Window Movement ====================
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
nnoremap <left> <c-w><
nnoremap <right> <c-w>>

" ==================== Cursor Movement ====================
noremap J 3j
noremap K 3k
noremap W 3w
noremap B 3b
noremap H ^
noremap L $

" ==================== Insert Mode Cursor Movement ====================
inoremap <c-l> <c-o>a

" ==================== Running code ====================
noremap r :call Run()<CR>
func! Run()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % && ./a.out"
	endif
endfunction

" ===
" === Install Plugins with Vim-Plug
" ===
call plug#begin('$HOME/.config/nvim/plugged')
" Plug 'aonemd/quietlight.vim'	" 主题
Plug 'tomtom/tcomment_vim'  	" 注释， 使用gcc注释一行
Plug 'haya14busa/is.vim'    	" 解决搜索高亮问题并提升搜索
Plug 'famiu/bufdelete.nvim'		" 实现类似于:bd的功能并保存布局
Plug 'neoclide/coc.nvim', {'branch': 'release'}	" 一个能装插件的插件👍
Plug 'voldikss/vim-translator'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'liuchengxu/vista.vim'		" 查看变量和函数的窗口
Plug 'SirVer/ultisnips'		" 代码片段
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'  " 快速跳转
Plug 'brooth/far.vim'		" 搜索当前目录
Plug 'voldikss/vim-floaterm' " float terminal
Plug 'mbbill/undotree'
Plug 'olimorris/onedarkpro.nvim' " 主题
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }	" 主题
Plug 'vim-airline/vim-airline'	" 底栏
Plug 'vim-airline/vim-airline-themes'
" Plug 'tomasr/molokai'		" molokai主题
call plug#end()

" ===
" === colorscheme config
" ===
	colorscheme onedark
	autocmd ColorScheme * hi CocMenuSel ctermbg=237 guibg=#13354A
	" set termguicolors " enable true colors support
	" set t_Co=256
	" set background=light
	" colorscheme quietlight
	" " 设置光标
	" highlight Cursor guibg=LightBlue
	" set guicursor=n-v-c-sm:block-nCursor,i-ci-ve:ver50-iCursor-block-blinkon50,r-cr-o:hor20-blinkon300-nCursor
	" highlight NormalFloat ctermfg=59 ctermbg=231 guifg=#333333 guibg=#d3d3d3
	" " 调整coc补全列表颜色
	" highlight CocMenuSel guibg=LightBlue
	 
" ===
" === vim_current_word
" ===
	" " Twins of word under cursor:
	" let g:vim_current_word#highlight_twins = 1
	" " The word under cursor:
	" let g:vim_current_word#highlight_current_word = 1

" ===
" === vim-airline
" ===
	let g:airline#extensions#tabline#enabled = 1

" ===
" ===  bufdelete
" ===
	nnoremap <leader>x :Bdelete<cr>

" ===
" === vim-tranlator
" ===
	" let g:translator_target_lang = 'en'
	nmap <silent> <Leader>t <Plug>TranslateW
	vmap <silent> <Leader>t <Plug>TranslateWV
	nnoremap <silent><expr> <M-f> translator#window#float#has_scroll() ?
								\ translator#window#float#scroll(1) : "\<M-f>"
	nnoremap <silent><expr> <M-b> translator#window#float#has_scroll() ?
								\ translator#window#float#scroll(0) : "\<M-f>"

" ===
" === UltiSnips
" ===
	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpForwardTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" ===
" === easymotion
" ===
	map  <Leader>f <Plug>(easymotion-bd-f)
	nmap <Leader>f <Plug>(easymotion-overwin-f)
	" Move to line
	map <Leader>g <Plug>(easymotion-bd-jk)
	nmap <Leader>g <Plug>(easymotion-overwin-line)

" ===
" === Far.vim
" ===
" noremap <leader>f :F  **/*<left><left><left><left><left>

" ===
" === undotree
" ===
nnoremap <space>u :UndotreeToggle<CR>

" ===
" ===  coc.nvim
" ===
	let g:coc_global_extensions = [
				\'coc-explorer',
				\'coc-vimlsp', 
				\'coc-marketplace',
				\'coc-translator',
				\'coc-json',
				\'coc-clangd',
				\'coc-python',
				\'coc-rust-analyzer']

	function! CheckBackspace() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	inoremap <silent><expr> <c-space> coc#refresh()
	inoremap <silent><expr> <TAB>
		  \ coc#pum#visible() ? coc#pum#next(1):
		  \ CheckBackspace() ? "\<Tab>" :
		  \ coc#refresh()
	inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
	" inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" 按住光标时突出显示该符号及其参考。
	autocmd CursorHold * silent call CocActionAsync('highlight')

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

	augroup mygroup
	  autocmd!
	  " Setup formatexpr specified filetype(s)
	  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	  " Update signature help on jump placeholder
	  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	if has('nvim-0.4.0') || has('patch-8.2.0750')
	  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	endif

" ===
" === coc plugins config
" ===
" coc-explorer
	nnoremap <space>e <Cmd>CocCommand explorer<CR>

" coc-translator
	nmap <space>t <Plug>(coc-translator-p)
	vmap <space>t <Plug>(coc-translator-pv)

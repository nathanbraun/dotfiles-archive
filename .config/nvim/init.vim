"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')
"General plugins -----------------------------
Plug 'francoiscabrol/ranger.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'kana/vim-arpeggio'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki', { 'branch' : 'dev' }
Plug 'mattn/calendar-vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
" Plug 'junegunn/vim-easy-align'
" Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
" Plug 'radenling/vim-dispatch-neovim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kshenoy/vim-signature'
Plug 'liuchengxu/vim-which-key'
" On-demand lazy load
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'vim-scripts/YankRing.vim'
Plug 'tbabej/taskwiki'
Plug 'blindFS/vim-taskwarrior'
Plug 'powerman/vim-plugin-AnsiEsc'
" Plug 'michal-h21/vimwiki-sync'

"Navigation
Plug 'francoiscabrol/ranger.vim'

"Appearance plugins ---------------------------------
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

"Tim Pope plugins----------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-flatfoot'
" Plug 'tpope/vim-dispatch'

"Programming plugins -------------------------
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'AndrewRadev/switch.vim'
Plug 'jpalardy/vim-slime'
Plug 'hylang/vim-hy'
Plug 'sirver/ultisnips'
Plug 'ElmCast/elm-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'

"Color schemes ------------------------------
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'flazz/vim-colorschemes'
" Plug 'felixhummel/setcolors.vim'
" Plug 'nanotech/jellybeans.vim'
Plug 'junegunn/seoul256.vim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'KeitaNakamura/neodark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'aradunovic/perun.vim'

"Syntax ------------------------------
Plug 'junegunn/vim-journal'
call plug#end()

"-------------------------------------------------------------------------------
" Plugin Options
"-------------------------------------------------------------------------------

let g:arpeggio_timeoutlens = {'j':400, 'k':200}
"let g:ctrlp_map = '<leader>f'
let mapleader = "\<Space>" 
let g:ranger_map_keys = 0
let g:jsx_ext_required = 0
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown'}, {'path': '~/principles'}]
let g:vimwiki_folding='syntax'
let g:ack_autoclose=1
let g:ackprg = 'ag --vimgrep --smart-case'                                                   
" let g:deoplete#enable_at_startup = 1

let g:multi_cursor_exit_from_insert_mode = 0

" pymode
let g:pymode_lint_checkers=['pyflakes']
" let g:pymode_breakpoint_bind = '<leader>p'
let g:pymode_run_bind = "<C-S-e>"
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # XXX BREAKPOINT'
let g:pymode_doc = 0
let g:pymode_rope = 0 
let g:pymode_rope_lookup_project = 0 
let g:pymode_rope_complete_on_dot = 0 

" vimwiki
let g:vimwiki_table_mappings = 0
" autocmd BufEnter *.wiki :setlocal filetype=journal

" git options (fugitive and gitgutter)
nnoremap <leader>gw :Gwrite<CR><CR>
nmap <leader>ga <Plug>GitGutterStageHunk
nmap <leader>gu <Plug>GitGutterUndoHunk
nmap <leader>gp <Plug>GitGutterPreviewHunk
nnoremap <silent> <leader>gt :GitGutterSignsToggle<CR>
nnoremap <leader>gh :pc!<CR>
nnoremap <leader>gc :Gcommit -v -q %:p<CR>
nnoremap <leader>ci :Gcommit -q<CR>
nnoremap <leader>st :Gstatus<CR>
nnoremap <leader>gr :Gpush<CR>

" ranger
let g:ranger_map_keys = 0
map <leader>o :Ranger<CR>

" slime options
nmap <leader>s <Plug>SlimeMotionSend
nmap <leader>ss <Plug>SlimeLineSend
xmap <leader>s <Plug>SlimeRegionSend
let g:slime_python_ipython = 1

" easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"-------------------------------------------------------------------------------
" Appearance
"-------------------------------------------------------------------------------
set number
set colorcolumn=81

set termguicolors
colorscheme jellybeans

"-------------------------------------------------------------------------------
" Editor Settings
"-------------------------------------------------------------------------------

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab

" search options
set ignorecase

" 2 space tabs in html, js, css
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2
autocmd FileType vimwiki setlocal shiftwidth=2 tabstop=2

" let g:python3_host_prog = '/usr/bin/python3'
" let g:python_host_prog = '/usr/bin/python'

let g:python_host_prog = '/home/nbraun/.virtualenvs/neovim2/bin/python'
let g:python3_host_prog = '/home/nbraun/.virtualenvs/neovim/bin/python'
"-------------------------------------------------------------------------------
" Behavior
"-------------------------------------------------------------------------------
autocmd! bufwritepost init.vim source % " automatically apply changes in init.vim

filetype plugin on

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.csv,*.pickle,*.xlsx,*xls,*.docx,*.doc,*.pyc,*.png,*.jgp,*/node_modules/*,*/tmp/*
set noswapfile
set nobackup
set nowb

" show command/search history
noremap : q:i
noremap / q/i

" copy rest of line with Y
map Y y$

" for work linux 
map "* "+

let g:slime_target = "tmux"

"-------------------------------------------------------------------------------
" KEYBINDINGS
"-------------------------------------------------------------------------------
" escape
call arpeggio#map('i', '', 0, 'jk', '<Esc>')

map <leader>x "*
nnoremap <silent> <leader>d "=strftime("%Y-%m-%d")<CR>P

" buffer and ctrlp bindings
"nmap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :Files<CR>
nmap <silent> <leader>r :History<CR>

nnoremap <leader>/ :Ack!<Space>
"nmap <silent> <leader>r :CtrlPMRU<CR>
noremap <Leader>n :bnext<CR>
noremap <Leader>v :vsplit<CR>

" vimwiki bindings
noremap <Leader>wn :VimwikiDiaryNextDay<CR>
noremap <Leader>wp :VimwikiDiaryPrevDay<CR>
nmap <leader>o :Ranger<CR>
" for gtd lists
noremap <silent><Leader>i :e ~/vimwiki/inbox.wiki<CR>
noremap <silent><Leader>ph :e ~/vimwiki/projects.wiki<CR>
noremap <silent><Leader>wr :e ~/vimwiki/reference.wiki<CR>
noremap <silent><Leader>wo :e ~/vimwiki/waiting-for.wiki<CR>
noremap <silent><Leader>we :e ~/vimwiki/someday.wiki<CR>

autocmd FileType journal nnoremap <buffer> <leader>j :set filetype=vimwiki<CR>
autocmd FileType vimwiki nnoremap <buffer> <leader>j :set filetype=journal<CR>
" noremap <leader>wj :set filetype=journal<CR>
" noremap <leader>wk :set filetype=vimwiki<CR>

noremap <leader>y :Goyo<CR>

" ultisinps
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsSnippetsDir = $HOME."/.config/UltiSnips"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.config/UltiSnips']
let g:UltiSnipsEnableSnipMate = 0

" elm
let g:elm_setup_keybindings = 0
" let g:elm_format_autosave = 0

" shortcuts
nmap <leader>as A [[segmentation]] @workkj0WWW
nmap <leader>al A [[large-tract-homes]] @workkj0WWW
nmap <leader>af A [[fraud-fix]] @workkj0WWW
nmap <leader>ac A [[commercial]] @workkj0WWW
nmap <leader>ay A [[propensity]] @workkj0WWW

nmap <silent><leader>pl :e ~/vimwiki/large-tract-homes.wiki<CR>
nmap <silent><leader>pf :e ~/vimwiki/fantasymath.wiki<CR>
nmap <silent><leader>po :e ~/vimwiki/overall.wiki<CR>
nmap <silent><leader>pw :e ~/vimwiki/work.wiki<CR>

let g:pymode_breakpoint = 0

" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:task_rc_override = 'rc.defaultheight=0'

let g:taskwiki_markup_syntax='markdown'

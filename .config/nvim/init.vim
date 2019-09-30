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
Plug 'wellle/targets.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kshenoy/vim-signature'
Plug 'liuchengxu/vim-which-key'
" Plug 'vim-scripts/YankRing.vim'
Plug 'tbabej/taskwiki'
Plug 'blindFS/vim-taskwarrior'
Plug 'powerman/vim-plugin-AnsiEsc'

"Navigation
Plug 'francoiscabrol/ranger.vim'

"Tim Pope plugins----------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-flatfoot'

"Programming plugins -------------------------
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'AndrewRadev/switch.vim'
Plug 'jpalardy/vim-slime'
" Plug 'hylang/vim-hy'
" Plug 'sirver/ultisnips'
Plug 'ElmCast/elm-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'
Plug 'psf/black'

"Color schemes ------------------------------
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'flazz/vim-colorschemes'

"Syntax ------------------------------
Plug 'junegunn/vim-journal'
call plug#end()

" get operating system
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

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
nnoremap <leader>gaa :Gwrite<CR><CR>
nmap <leader>ga <Plug>GitGutterStageHunk
nmap <leader>gu <Plug>GitGutterUndoHunk
nmap <leader>gp <Plug>GitGutterPreviewHunk
nnoremap <silent> <leader>gt :GitGutterSignsToggle<CR>
nnoremap <leader>gh :pc!<CR>
nnoremap <leader>gc :Gcommit -v -q %:p<CR>
nnoremap <leader>ci :Gcommit -q<CR>
nnoremap <leader>ca :Gcommit --amend<CR>
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

if g:os == "Darwin"
    let g:python_host_prog = $HOME.'/Envs/neovim2/bin/python'
    let g:python3_host_prog = $HOME.'/Envs/neovim/bin/python'
elseif g:os == "Linux"
    let g:python_host_prog = '/home/nbraun/.virtualenvs/neovim2/bin/python'
    let g:python3_host_prog = '/home/nbraun/.virtualenvs/neovim/bin/python'
endif

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
nnoremap <silent> <leader>d "=strftime("%Y-%m-%d")<CR>p

" buffer and ctrlp bindings
"nmap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :Files<CR>
nmap <silent> <leader>r :History<CR>

nnoremap <leader>/ :Ack!<Space>
"nmap <silent> <leader>r :CtrlPMRU<CR>
noremap <Leader>v :vsplit<CR>

" vimwiki bindings
noremap <Leader>wn :VimwikiDiaryNextDay<CR>
noremap <Leader>wp :VimwikiDiaryPrevDay<CR>
nmap <leader>o :Ranger<CR>

" taskwiki
noremap <leader>ttn :TaskWikiMod +na<CR>
noremap <leader>tts :TaskWikiMod +ten<CR>
noremap <leader>ttd :TaskWikiMod +deep<CR>
noremap <leader>ttc :TaskWikiMod +computer<CR>
noremap <leader>ttg :TaskWikiMod +gmail<CR>
noremap <leader>ttp :TaskWikiMod +planning<CR>
noremap <leader>ttw :TaskWikiMod +wed<CR>
noremap <leader>ttrb :TaskWikiMod project:info.read.business<CR>
noremap <leader>ttrp :TaskWikiMod project:info.read.productivity<CR>
noremap <leader>ttrs :TaskWikiMod project:info.read.science<CR>
noremap <leader>ttre :TaskWikiMod project:info.read.econ<CR>
noremap <leader>ttrm :TaskWikiMod project:info.read.misc<CR>
noremap <leader>ttrc :TaskWikiMod project:info.read.coding<CR>
noremap <leader>ttrh :TaskWikiMod project:info.read.history<CR>

autocmd FileType journal nnoremap <buffer> <leader>j :set filetype=vimwiki<CR>
autocmd FileType vimwiki nnoremap <buffer> <leader>j :set filetype=journal<CR>
" noremap <leader>wj :set filetype=journal<CR>
" noremap <leader>wk :set filetype=vimwiki<CR>

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


let g:pymode_breakpoint = 0

" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:task_rc_override = 'rc.defaultheight=0'

let g:taskwiki_markup_syntax='markdown'

"""""""""""
" shortcuts
"""""""""""
" general
noremap <silent><Leader>i :e ~/vimwiki/index.wiki<CR>
noremap <silent><Leader>n :e ~/vimwiki/next-actions.wiki<CR>
noremap <silent><Leader>p :e ~/vimwiki/pain.wiki<CR>
noremap <silent><Leader>e :e $MYVIMRC<CR>

noremap <silent><Leader>le :e ~/vimwiki/business-ideas.wiki<CR>
noremap <silent><Leader>lb :e ~/vimwiki/blog-post-ideas.wiki<CR>
noremap <silent><Leader>lm :e ~/vimwiki/mistakes.wiki<CR>
noremap <silent><Leader>lp :e ~/vimwiki/projects.wiki<CR>
noremap <silent><Leader>lr :e ~/vimwiki/reference.wiki<CR>
noremap <silent><Leader>lw :e ~/vimwiki/waiting.wiki<CR>
noremap <silent><Leader>ls :e ~/vimwiki/someday.wiki<CR>
noremap <silent><Leader>lwr :e ~/vimwiki/weekly-review.wiki<CR>
noremap <silent><Leader>lk :e ~/vimwiki/kids.wiki<CR>
noremap <silent><Leader>ll :e ~/vimwiki/reading-list.wiki<CR>
noremap <silent><Leader>lbtr :e ~/vimwiki/books-to-read.wiki<CR>
noremap <silent><Leader>lga :e ~/vimwiki/good-albums.wiki<CR>
noremap <silent><Leader>lg :e ~/vimwiki/gifts-to-buy.wiki<CR>

""""""""""
" projects
""""""""""
" work
noremap <silent><leader>lpl :e ~/vimwiki/project-large-tract-homes.wiki<CR>
noremap <silent><leader>lpp :e ~/vimwiki/project-commercial-prefill.wiki<CR>
noremap <silent><leader>lps :e ~/vimwiki/project-segmentation.wiki<CR>
noremap <silent><leader>lpq :e ~/vimwiki/project-propensity-evaluation.wiki<CR>
noremap <silent><leader>lpi :e ~/vimwiki/project-ibuyer.wiki<CR>
noremap <silent><leader>lpc :e ~/vimwiki/project-loansafe-connect.wiki<CR>
noremap <silent><leader>lpr :e ~/vimwiki/project-g1-propensity-retrain.wiki<CR>

" personal
noremap <silent><leader>lpf :e ~/vimwiki/project-fantasymath.wiki<CR>
noremap <silent><leader>lpb :e ~/vimwiki/project-fantasybook.wiki<CR>
noremap <silent><leader>lph :e ~/vimwiki/project-home.wiki<CR>

autocmd BufWritePost reading-list.wiki silent! !~/reading_list_to_html

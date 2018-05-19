" setting
"
"文字コードをUFT-8に設定
set fenc=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 新しい行を開始した時に，新しい行のインデントと同じにする
set autoindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest

set fileencoding=utf-8
set encoding=utf-8
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" molocai用の設定
syntax on
colorscheme molokai
set t_Co=256

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 操作系
" backspace で前の行に戻れるようにする
set backspace=indent,eol,start

" クリップボードとの連携
set clipboard+=unnamed

" zshっぽい補完
set wildmode=list,full

" NeoBundleの設定（よくわからん)
if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするプラグインをここに記述
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'othree/html5.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'fatih/vim-go'
NeoBundle 'scrooloose/nerdtree'
NeoBundle "scrooloose/syntastic"
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'andviro/flake8-vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'lervag/vimtex'
NeoBundle "tyru/caw.vim.git"
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'justmao945/vim-clang'
NeoBundle 'Shougo/neocomplcache'

call neobundle#end()

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

" neocomplete 起動時に有効
let g:neocomplete#enable_at_startup = 1

" go用の設定
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
call plug#end()
let g:syntastic_mode_map = { 'mode': 'passive',
  \ 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint']
let g:go_fmt_command = "goimports"

" indent guidsの設定
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
" 自動カラー無効
let g:indent_guides_auto_colors=0

" clang-format を保存時にかける
function! s:clang_format()
    let now_line = line(".")
    exec ":%! clang-format"
    exec ":" . now_line
endfunction

if executable('clang-format')
  augroup cpp_clang_format
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.h call s:clang_format()
    autocmd BufWrite,FileWritePre,FileAppendPre *.cpp call s:clang_format()
  augroup END
endif

" vimtexの設定
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
let g:vimtex_compiler_latexmk = {
            \ 'background' : 0,
            \ 'build_dir' : '',
            \ 'continuous' : 1,
            \ 'options' : [
            \   '-pdfdvi',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}

" 'justmao945/vim-clang' 
"
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {} 
  endif
let g:neocomplete#force_omni_input_patterns.c =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

let g:clang_auto = 0

let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

function! s:get_latest_clang(search_path)
  let l:filelist = split(globpath(a:search_path, 'clang-*'), '\n')
  let l:clang_exec_list = []
  for l:file in l:filelist
    if l:file =~ '^.*clang-\d\.\d$'
      call add(l:clang_exec_list, l:file)
    endif
  endfor
  if len(l:clang_exec_list)
    return reverse(l:clang_exec_list)[0]
  else
    return 'clang'
  endif
endfunction

function! s:get_latest_clang_format(search_path)
  let l:filelist = split(globpath(a:search_path, 'clang-format-*'), '\n')
  let l:clang_exec_list = []
  for l:file in l:filelist
    if l:file =~ '^.*clang-format-\d\.\d$'
      call add(l:clang_exec_list, l:file)
    endif
  endfor
  if len(l:clang_exec_list)
    return reverse(l:clang_exec_list)[0]
  else
    return 'clang-format'
  endif
endfunction

let g:clang_exec = s:get_latest_clang('/usr/bin')
let g:clang_format_exec = s:get_latest_clang_format('/usr/bin')

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11'
let g:clang_auto = 0

" neocomplcacheの設定
let g:acp_enableAtStartup = 4
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : ''
\ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


" 中括弧のインデントを賢くする
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" 基本的なsetting を書きます 

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
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" 新しい行を開始した時に，新しい行のインデントと同じにする
set autoindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" molokaiのテーマを使う
syntax on
colorscheme molokai
set t_Co=256

" Tab系
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=2

" 操作系
" backspace で改行を消せるようにする
set backspace=2
" clipboard 連携
set clipboard+=unnamed
" ctrl+p でヤンクしたのをペーストするようにする
vnoremap <silent> <C-p> "0p<CR>

" dein の設定
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/.cache/dein')
let s:toml_dir = expand('~/dotfiles/dein')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  "Load TOML
  let s:toml = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  if dein#check_install()
	call dein#install()
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

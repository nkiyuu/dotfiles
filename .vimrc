syntax enable
syntax on " シンタックスハイライトを有効化
let mapleader="\<space>" " Leader キーをスペースに変更

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/y-nozaki/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/y-nozaki/.cache/dein')
  call dein#begin('/Users/y-nozaki/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/y-nozaki/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#load_toml('/Users/y-nozaki/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('/Users/y-nozaki/.config/nvim/dein_lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on " ファイルタイプに基づいたインデントを有効化
set autoindent " 新しい行を始めるときに自動でインデント
set expandtab " タブをスペースに変換
set tabstop=2 " タブをスペース2文字とカウント
set shiftwidth=2 " 自動インデントに使われるスペースの数
set backspace=2 " バックスペースの挙動の問題を修正
set noswapfile " swap ファイルを作成しない
set foldmethod=indent " インデントで折りたたむようにする
set wildmenu " Netrw の wildmenu を有効にする
set wildmode=list:longest,full " 最長マッチまで保管してから自動補完メニューを開く
set clipboard=unnamed " システムのクリップボードにデフォルトでコピーする
set undofile " undofileを設定する
if !isdirectory(expand("$HOME/.vim/undodir"))
    call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir
set tags=tags; " 親ディレクトリにあるtagsファイルを再起的に探す
set hlsearch " 検索結果をハイライトする
set background=dark " dark モードで表示
set laststatus=2 " statusバーを常時表示
set number " 行数を表示
set encoding=utf-8 " vim 内部での文字コードを定義
set fileencoding=utf-8 " ファイル書き込み時の文字コード
set fileencodings=utf-8,cp932 " ファイル読み込み時の文字コード

nnoremap <ESC><ESC> :noh<CR> " <ESC>２回で検索ハイライトを消す

autocmd BufRead * normal zR " バッファー読み込み時に zR を実行
augroup ctags " tags の自動生成
  autocmd!
  autocmd BufWritePost * silent !ctags -R -f --links=no .tags
augroup END


colorscheme molokai " カラースキームを変更

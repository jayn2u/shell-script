" 파일 인코딩
set encoding=utf-8

" 라인 번호 및 상대 라인 번호
set number
set relativenumber

" 탭과 들여쓰기
set tabstop=4
set shiftwidth=4
set expandtab      " 탭을 스페이스로 변환
set autoindent     " 자동 들여쓰기

" 검색 설정
set ignorecase     " 대소문자 무시
set smartcase      " 검색 시 대소문자 구분
set hlsearch       " 검색 결과 강조
set incsearch      " 검색 중 매칭되는 부분 강조

" 커서 설정
set cursorline     " 현재 라인 강조
set wrap           " 텍스트 줄바꿈
set scrolloff=8    " 커서 주변 여백 유지

" 클립보드 설정 (시스템 클립보드와 연동)
set clipboard=unnamedplus

" 컬러 테마
syntax on
colorscheme desert   " 기본 테마 변경 (desert, gruvbox 등)

" 24비트 컬러 활성화
set termguicolors

call plug#begin('~/.vim/plugged')

" 파일 탐색기
Plug 'preservim/nerdtree'

" Fuzzy Finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" 상태라인 플러그인
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" LSP 및 자동 완성
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git 플러그인
Plug 'tpope/vim-fugitive'

call plug#end()

" 파일 탐색기 단축키
nnoremap <C-n> :NERDTreeToggle<CR>

" 저장 및 종료 단축키
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>

" 창 이동 단축키
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Fuzzy Finder 단축키
nnoremap <C-p> :Files<CR>

" 파일 저장 시 자동으로 포맷팅
autocmd BufWritePre *.js,*.py,*.java :normal gg=G

" =================================================================================================
"
" Arquivo com as configurações básicas do meu Vim
" Autor: Dk4LL (dk4ll@proton.me)
" Versão: 1.0
" Data: 27/10/2023
"
" =================================================================================================


" Desativa o modo de compatibilidade com o Vi
set nocompatible

" Define a codificação padrão de texto do Vim
set encoding=utf-8

"  Define a codificação padrão para a leitura de Vimscript
scriptencoding utf-8

" Exibe enumeração nas linhas
set number

" Exibe a numeração relativa das linhas
set relativenumber

" Exibe as colunas
set ruler

" Define 50 como a quantidade de comando salvos no histórico do vim
set history=15

" Ativa o uso correto da tecla backspace
set backspace=indent,eol,start 

" Ativa a detecção do tipo e dos plugins com respeito ao tipo dos arquivos
filetype plugin on
filetype indent on

" Ativa sintaxe highlight básica do vim
syntax on

" Ativa o highlight na linha do cursor
set cursorline

" Ativa que modifições nos arquivos externamente ao vim sejam carregas no vim
set autoread
au FocusGained,BufEnter * silent! checktime

" Define a leader key
let mapleader = "\<Space>"

" Define 7 linhas (quando possível) sejam exibidas acima e abaixo do cursor
set so=7

" Ativa a exibição de recomendações no menu de comandos
set wildmenu

" Define a altura do menu de comandos
set cmdheight=2

" Ativa suporte total ao mouse
set mouse=a

" Define o tempo em decimos de segundo que o Vim aguardará antes de destacar o par de delimitadores
set matchtime=3

" Adiciona os caracteres  '<' e '>' à lista de caracteres cujos pares são automaticamente destacados
set matchpairs+=<:>

" Ativa o realce da correspondência entre os pares de: (,) [, ], {, }, < e > quando o cursor estiver sobre eles
set showmatch

" Ativa o gerecimento de quebra de linha 'inteligente', quebra para torna mais legível
set linebreak

" Ativa o comportamento de indentação automática
set autoindent

" Ativa a pesquisa (busca) incremental
set incsearch

" Ativa o ignore case inteligente durante a pesquisa
set smartcase

" Ativa o highlight na pesquisa
set hlsearch

" Configura o modo de expansão de tabs para usar 'espaço' aumentando a compatibilidade 
set et

" Define que o Tab equivale a 4 'espaços'
set tabstop=2

" Define a largura do shif + >> (<<) para identação no modo normal
set shiftwidth=2

" Ativa o suporte a cores de 24 bits
set termguicolors

" Desativa a notificação de modo em uso
set noshowmode

" Ativa a mudança entre buffers sem a necessidade de salvar
set hidden

" Define que os folds seja marcados pela indentação
set foldmethod=indent

" Para a configuração do LSP Ocaml no Vim
"set rtp^="/Users/valdigleis/.opam/default/share/ocp-indent/vim"

" Para a configuração do LSP latex funcionar corretamente
let g:tex_flavor = "tex"


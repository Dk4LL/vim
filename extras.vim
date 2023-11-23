" =================================================================================================
"
" Arquivo para a instalação e configuração de pacotes (plugins) no meu vim
" Autor: Dk4LL (dk4ll@proton.me)
" Data: 27/10/2023
"
" =================================================================================================

call plug#begin()

  " Plugins para Tema de cores (Iceberg, Catppuccin e Nord)
  "Plug 'cocopon/iceberg.vim'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  "Plug 'arcticicestudio/nord-vim'

  " Plugin tema de cores para a barra de status
  Plug 'gkeep/iceberg-dark'

  " Plugin para a barra de status
  Plug 'itchyny/lightline.vim'

  " Plugin wrapper do Git no vim
  Plug 'tpope/vim-fugitive'

    " Plugin para o Browser-server
  Plug 'https://github.com/wolandark/vim-live-server.git'

  " Plugin para gliphicons
  Plug 'ryanoasis/vim-devicons'

  " Plugin para o explore de arquivos
  Plug 'preservim/nerdtree'

  " Plugin para o Emmet no Vim 
  Plug 'mattn/emmet-vim'

  " Plugin para o Hoogle no vim
  "Plug 'twinside/vim-hoogle'

  " Plugin para destaque de indentação
  "Plug 'preservim/vim-indent-guides'


  " Plugin para o LSP
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()



" =================================================================================================
"
" Configuração dos pacotes
"
" =================================================================================================



" -------------------------------------------------------------------------------------------------
" Iceberge
" -------------------------------------------------------------------------------------------------
" Ativa o pacote de cores (Iceberg)
" colorscheme iceberg

" -------------------------------------------------------------------------------------------------
" Catppuccin
" -------------------------------------------------------------------------------------------------
" Ativa o pacote de cores Catppuccin, possui as opções: Mocha, Macchiato, Frappé e Latte
colorscheme catppuccin_frappe



" -------------------------------------------------------------------------------------------------
" Lightline
" -------------------------------------------------------------------------------------------------
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'catppuccin_mocha',
      \ 'separator': {'left': "", 'right': ''},
      \ 'active': {
      \     'left' : [ ['mode', 'paste'], ['readonly', 'filename'], ['gitbranch'] ],
      \     'right': [ ['clock'], [ 'lineinfo', 'percent' ], ['fileformat', 'fileencoding', 'filetype'], ['status'] ]
      \ },
      \ 'inactive': {
      \     'left': [ ['filename'] ],
      \     'right': [ ['clock'], ['status'] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'LightlineBranchname',
      \   'status': 'StatusDiagnostic',
      \   'clock': 'MyTime'
      \ },
      \ }


function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' ' : ''
  return filename . modified
endfunction

function! LightlineBranchname()
  if isdirectory(getcwd() . '/.git')
    let branch = FugitiveHead()
    return " " . branch
  else
    return '[No git]'
  endif
 endfunction

function! MyTime()
  "let current_time = strftime("%c")
  let current_time = strftime("%H:%M")
  return "  " . current_time
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return '  0    0    0'
  else
    return '  ' .  string(info['error'])  . '    ' . string(info['warning']) . '    ' . string(info['hint'])
  endif
endfunction



" -------------------------------------------------------------------------------------------------
" Vim-devicons
" -------------------------------------------------------------------------------------------------

" Carrega de fato o plugin
let g:webdevicons_enable = 1

" Adiciona as flags no NERDTree
let g:webdevicons_enable_nerdtree = 1

" Define a quantidade de espaço após um glyph character (o padrão é ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" Forçar preenchimento extra no NERDTree fazendo os ícones de arquivo se alinhem verticalmente
"let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1



" -------------------------------------------------------------------------------------------------
" Emmet-vim
" -------------------------------------------------------------------------------------------------

" Modos onde o Emmet-vim está ativo
let g:user_emmet_mode='inv'

" Ativa o Emmet-vim apenas para arquivos html e css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall



" -------------------------------------------------------------------------------------------------
" Vim-indent-guides
" -------------------------------------------------------------------------------------------------

" Ativa o uso do Vim-indent-guides
"let g:indent_guides_enable_on_vim_startup = 1

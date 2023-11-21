" =================================================================================================
"
" Arquivo com as configurações de mapeamento de teclas do meu Vim
" Autor: Dk4LL (dk4ll@proton.me)
" Versão: 1.0
" Data: 20/11/2023
"
" =================================================================================================

" -------------------------------------------------------------------------------------------------
" Remapeando comando básicos do Vim
" -------------------------------------------------------------------------------------------------

" Inicia um terminal em um janela de terminal própria, fora do vim
nnoremap <silent> <leader>T :term <CR>

" Mudança entre as janelas no sentido esqueda, direita, cima e baixo
nnoremap <silent> <leader>wl <C-w>h
nnoremap <silent> <leader>wr <C-w>l
nnoremap <silent> <leader>wu <C-w>k
nnoremap <silent> <leader>wd <C-w>j

" Split de buffer em janela vertical e horizontal
nnoremap <silent> <leader>wv <C-w>v
nnoremap <silent> <leader>wh <C-w>s

" Redimensionar janelas para cima e baixo.
nnoremap <silent> <leader>wU <C-w><C-->
nnoremap <silent> <leader>wD <C-w><C-+>
nnoremap <silent> <leader>wL <C-w><
nnoremap <silent> <leader>wR <C-w>>

" Fecha a janela atual
nnoremap <silent> <leader>wc <C-w>q

" -------------------------------------------------------------------------------------------------
" Mapeando funções disponibilizadas por plugins
" -------------------------------------------------------------------------------------------------

" *** PLUGIN VIM-LIVE-SERVER ***

" Inicia o browser-server (Porta padrão 3000)
nnoremap <leader>bs :StartBrowserSync <CR>

" Encerra o browser-server (Porta padrão 3000)
nnoremap <leader>bS :KillBrowserSync <CR>

" Inicia o browser-server na porta N (é preciso informa o valor N e apertar a tecla enter)
" nnoremap <leader>bn :StartBrowserSyncOnPort N <CR>

" Encerra o browser-server na porta N (é preciso informa o valor N e apertar a tecla enter)
" nnoremap <leader>bN KillBrowserSyncOnPort N <CR>



" *** PLUGIN NERDTREE ***

" Abre a NERDTree
nnoremap <silent> <leader>to :NERDTree<CR>
" Fecha a NERDTree
nnoremap <silent> <leader>tc :NERDTreeClose<CR>
" Abre o NERDTree, ou muda para a janela do NERDTree se ela já estiver aberta
nnoremap <silent> <leader>tf :NERDTreeFocus<CR>
" Muda o root do NERDTree para diretório de trabalho atual, se não tiver um NERDTree aberto o mesmo será criado
nnoremap <silent> <leader>tw :NERDTreeCWD<CR>
" Atualiza o diretório root do NERDTree
nnoremap <silent> <leader>tr :NERDTreeRefreshRoot<CR> 

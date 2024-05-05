set ts=4 sw=4 ai cul nu rnu mps+=<:> hls noswf

let mapleader=" "
vnoremap <leader>y "+y
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

vnoremap > >gv
vnoremap < <gv

nnoremap x "_x
vnoremap x "_x

color habamax
syntax enable

autocmd TextChanged,TextChangedI * silent! write

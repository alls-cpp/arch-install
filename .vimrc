set ts=4 sw=4 ai rnu mps+=<:> hls noswf

let mapleader=" "
vnoremap <leader>y "+y

vnoremap > >gv
vnoremap < <gv

nnoremap x "_x
vnoremap x "_x

color habamax
syntax enable

autocmd TextChanged,TextChangedI * silent! write

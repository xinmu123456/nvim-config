"---load lua profile---"
" basic configuration
lua require('basic')
" Packer plug manager
lua require('plugins')
" hot keys bind
lua require('keybindings')

" 皮肤设置
set background=dark " or light if you want light mode
"colorscheme zephyr
colorscheme nightfox

"---key map---"
imap jk <ESC>


"---plugins---"
" call plug#begin('~/.vim/plugged')
" Plug 'scrooloose/nerdtree'
"call plug#end()

lua require('plugin-config/nvim-tree')
lua require('plugin-config/bufferline')
lua require('plugin-config/nvim-treesitter')
lua require('plugin-config/nvim-lualine')
"-- load custom configuration
"-- config path
lua package.path = package.path .. ';/home/xinmu/.config/nvim/?.lua'
lua require('lsp/setup')
lua require('lsp/nvim-cmp')
"---map plugin to hot key---"
" map <silent> <C-e> :NERDTreeToggle<CR>

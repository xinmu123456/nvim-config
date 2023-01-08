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
" colorscheme nightfox
colorscheme tokyonight

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
lua require('plugin-config/dashboard')
lua require('plugin-config/telescope')
lua require('plugin-config/nvim-autopairs')
lua require('plugin-config/indent_blankline')
lua require('plugin-config/fidget')
lua require('plugin-config/gitsigns')
lua require('plugin-config/surround')
lua require('plugin-config/comment')
lua require('plugin-config/toggleterm')
"-- load custom configuration
"-- config path
lua package.path = package.path .. ';/home/xinmu/.config/nvim/?.lua'
lua require('lsp/setup')
lua require('lsp/nvim-cmp')
lua require('lsp/formatter')
lua require('lsp/null-ls')
lua require('lsp/ui')
"---map plugin to hot key---"
" map <silent> <C-e> :NERDTreeToggle<CR>

" other
let g:rainbow_active = 1

" 在wsl时和windows共享剪贴板
set clipboard^=unnamed,unnamedplus

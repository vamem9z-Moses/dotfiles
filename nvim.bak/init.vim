call plug#begin()

"UI Plugins
Plug 'folke/tokyonight.nvim'
Plug 'nvim-lualine/lualine.nvim'

" Add File Tree
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" Support for autosave
Plug 'Pocco81/auto-save.nvim'

" Language Server Support  
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Support for autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Support for git 
Plug 'nvim-lua/plenary.nvim'
Plug 'petertriho/cmp-git' 

" Support for dap
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'

" Support for linters
Plug 'mfussenegger/nvim-lint'

" Support for Clojure 
Plug 'Olical/conjure'
Plug 'PaterJason/cmp-conjure'

" Support for Snippets - required for nvm-cmd
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

lua require('config')

"Set Color scheme
colorscheme tokyonight-storm

" Show line numbers
set number


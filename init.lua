-- Vim-plug
local Plug = vim.fn['plug#']
vim.call('plug#begin')
-- The default plugin directory will be as follows:
--   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'

-- Any valid git URL is allowed
-- Embark theme
Plug('embark-theme/vim', { as = 'embark', branch = 'main' })

-- Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Ale
Plug 'dense-analysis/ale'

-- lightline
Plug 'itchyny/lightline.vim'

-- Rust
Plug 'rust-lang/rust.vim'

-- Autopairs
Plug 'windwp/nvim-autopairs'

-- Initialize plugin system
vim.call('plug#end')

-- Treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  -- ensure_installed = { "c", "lua", "rust" },
  -- ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.opt.termguicolors = true;
vim.opt.showmode = false;
vim.opt.relativenumber = true;
vim.opt.signcolumn = "yes";

-- Indentation
-- set tabstop=8
-- set softtabstop=4
-- set shiftwidth=4
-- set expandtab

-- LSP
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.svelte.setup{}
-- Autopairs
require("nvim-autopairs").setup{}

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
vim.cmd('colorscheme embark')
vim.g.rustfmt_autosave = 1
vim.g.lightline = { colorscheme = 'embark' }
-- need rust analyzer

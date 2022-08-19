-- Vim-plug
local Plug = vim.fn['plug#']
vim.call('plug#begin')
-- The default plugin directory will be as follows:
--   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'

-- Any valid git URL is allowed

-- Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Ale
Plug 'dense-analysis/ale'

-- lightline
Plug 'itchyny/lightline.vim'

-- Autopairs
Plug 'windwp/nvim-autopairs'

-- Telescope
Plug 'nvim-lua/plenary.nvim' -- dependency
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })

-- Rust
Plug 'rust-lang/rust.vim'

-- Embark theme
Plug('embark-theme/vim', { as = 'embark', branch = 'main' })

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

-- LSP
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.svelte.setup{}

-- Autopairs
require("nvim-autopairs").setup{}

-- Keybindings

-- Telescope
vim.keymap.set('n', 'ff', function()
	require('telescope.builtin').find_files()
end, {desc = 'Telescope find_file'})

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
vim.cmd('colorscheme embark')

-- Settings

-- General
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes' -- prevents ALE from shifting everything
vim.opt.autoindent = true
vim.opt.cc = '100'
-- ALE
vim.g.ale_fixers = {
	html = 'prettier',
	css = 'prettier',
	javascript = 'prettier',
	svelte = 'prettier'
}
vim.g.ale_fix_on_save = 1
vim.g.ale_completion_enabled = 1

-- Rust
vim.g.rustfmt_autosave = 1

-- Lightline Settings
vim.g.lightline = { colorscheme = 'embark' }

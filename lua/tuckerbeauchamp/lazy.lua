-- lazy.nvim configuration file
--
--
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({

    -- Syntax Highlighter
    {
        'nvim-treesitter/nvim-treesitter',
        build = function ()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        }
    },

    -- Copilot
    "github/copilot.vim",

    -- Keep current context above cursor
    "nvim-treesitter/nvim-treesitter-context",

    -- Undotree to keep undos stored for later use
    "mbbill/undotree",

    -- Formatter that respects prettier
    "sbdchd/neoformat",

    -- Comment out line of text
    "tpope/vim-commentary",

    -- Allow text wrapping based off symbol
    "tpope/vim-surround",

    -- Linter
    "mfussenegger/nvim-lint",

    -- web dev icons for below packages. trying to prevent depency issue
    'nvim-tree/nvim-web-devicons',

    -- Fuzzy Finder
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    },

    -- Language server managed by Mason
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            --- Uncomment these if you want to manage LSP servers from neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- LSP Support
            'neovim/nvim-lspconfig',
            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
        }
    },

    -- Auto create pairs ()/{} etc..
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    -- Status Line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
})

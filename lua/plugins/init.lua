local plugins = {
        "prichrd/netrw.nvim",
        "neovim/nvim-lspconfig",
        "akinsho/bufferline.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "github/copilot.vim",
        "electron-highlighter/nvim",
        "nvim-tree/nvim-web-devicons"
}

require "lazy".setup(plugins)

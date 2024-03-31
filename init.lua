local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require "plugins"
vim.opt.termguicolors = true
require "bufferline".setup()

local capabilities = require "cmp_nvim_lsp".default_capabilities()

local lspconfig = require "lspconfig"

lspconfig.lua_ls.setup{
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspaces = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.expand "$VIMRUNTIME/lua/lsp"] = true,
				},
			},
		},
	},
}
lspconfig.clangd.setup{
	capabilities = capabilities
}

lspconfig.gopls.setup{
	capabilities = capabilities
}


local cmp = require "cmp"

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "cmp-nvim-lua" },
		{ name = "path" },
		{ name = "vsnipt" },
	}),
	mapping = cmp.mapping.preset.insert({
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-p>'] = cmp.mapping.complete(),
	}),
})

vim.cmd("colorscheme electron_highlighter")

require "nvim-web-devicons".setup()

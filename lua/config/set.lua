vim.opt.wrap = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- tab width and indentation settings
vim.opt.tabstop = 4 -- A tab character is 4 spaces wide
vim.opt.shiftwidth = 4 -- Indent with 4 spaces
vim.opt.softtabstop = 4 -- Tab in insert mode = 4 spaces
vim.opt.expandtab = true -- Tabs are spaces, not actual TAB
vim.opt.smartindent = true

vim.opt.undofile = true

vim.opt.scrolloff = 8 -- allows for scrolling before you hit bottom of screen
vim.opt.mousescroll = "ver:1" -- mouse scrolling moves 1 line vertically at a time

-- inline diagnostic settings
vim.diagnostic.config({
	virtual_text = {
		spacing = 2,
		source = "if_many",
	},
	underline = true,
	signs = true,
	severity_sort = true,
	update_in_insert = false,
})

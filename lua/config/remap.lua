vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", function() -- Save (n)
	vim.cmd("w")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>q", function() -- Quit (n)
	vim.cmd("q")
end, { noremap = true, silent = true })

-- nav
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- pane manager using alt
vim.keymap.set("n", "<M-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<M-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<M-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<M-k>", "<C-w>k", { noremap = true, silent = true })

-- ":sp" and ":vsp" for split and vertical split
vim.keymap.set("n", '"', ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "|", ":vsplit<CR>", { noremap = true, silent = true })

-- file finder
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
-- find in files
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })

-- which-key
vim.keymap.set("n", "<leader>?", function()
	require("Which-key").show({ global = false })
end, { noremap = true, silent = true })

-- remap copy/paste
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true }) -- copy on CTRL-c
vim.keymap.set("i", "<C-v>", '<Esc>"+pa', { noremap = true }) -- paste on CTRL-v
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>p", '"+p', { noremap = true, silent = true })

vim.keymap.set("v", "<C-/>", "gc", { noremap = true })
vim.keymap.set("n", "<C-/>", "gcc", { noremap = true })

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", function() -- Save (n)
	vim.cmd("w")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>q", function() -- Quit (n)
	vim.cmd("q")
end, { noremap = true, silent = true })

-- nav
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true})

-- pane manager
vim.keymap.set("n", "<M-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<M-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<M-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<M-k>", "<C-w>k", { noremap = true, silent = true })

-- ":sp" and ":vsp" for split and vertical split

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true})


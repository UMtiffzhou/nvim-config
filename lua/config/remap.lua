vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", function()
	vim.cmd("w")
end, { noremap = true, silent = true, desc = "Save" })

vim.keymap.set("n", "<leader>q", function()
	vim.cmd("q")
end, { noremap = true, silent = true, desc = "Quit" })

-- nav
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle Tree" })

-- pane manager using alt
vim.keymap.set("n", "<M-h>", "<C-w>h", { noremap = true, silent = true, desc = "Move left one pane" })
vim.keymap.set("n", "<M-l>", "<C-w>l", { noremap = true, silent = true, desc = "Move rigth one pane" })
vim.keymap.set("n", "<M-j>", "<C-w>j", { noremap = true, silent = true, desc = "Move up one pane" })
vim.keymap.set("n", "<M-k>", "<C-w>k", { noremap = true, silent = true, desc = "Move down one pane" })

-- ":sp" and ":vsp" for split and vertical split
vim.keymap.set("n", "<leader>'", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal split" })
vim.keymap.set("n", "<leader><CR>", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical split" })

-- file finder
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true, desc = "Find files" })
-- find in files
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true, desc = "Find in files" })

-- which-key
vim.keymap.set("n", "<leader>?", function()
	require("Which-key").show({ global = false })
end, { noremap = true, silent = true, desc = "Which key info" })

-- remap copy/paste
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, desc = "Copy from clipboard" })
vim.keymap.set("i", "<C-v>", '<Esc>"+pa', { noremap = true, desc = "Paste from clipboard" })
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copy from clipboard" })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copy from clipboard" })
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })
vim.api.nvim_set_keymap("v", "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })

-- esc to remove search highlighting once done
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- tab in visual selection
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent line" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Outdent line" })

-- ctrl backspace in insert mode
vim.keymap.set("i", "<C-H>", "<C-w>", { noremap = true, silent = true })

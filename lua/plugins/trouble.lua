return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		-- Diagnostics
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (workspace)" },
		{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)" },

		-- Lists
		{ "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", desc = "Quickfix" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },

		-- LSP pickers
		{ "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", desc = "LSP References" },
		{ "<leader>xd", "<cmd>Trouble lsp_definitions toggle<cr>", desc = "LSP Definitions" },
		{ "<leader>xi", "<cmd>Trouble lsp_implementations toggle<cr>", desc = "LSP Implementations" },
		{ "<leader>xt", "<cmd>Trouble lsp_type_definitions toggle<cr>", desc = "LSP Type Defs" },

		-- Symbols (outline)
		{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Document Symbols" },
	},
}

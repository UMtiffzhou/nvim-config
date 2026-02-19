return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			sh = { "shfmt" },
			python = { "black" },
		},
		format_on_save = function(bufnr)
			-- disable for large files
			if vim.api.nvim_buf_line_count(bufnr) > 5000 then
				return nil
			end
			return { lsp_fallback = true }
		end,
	},
	config = function(_, opts)
		require("conform").setup(opts)
		vim.keymap.set({ "n", "v" }, "<leader>F", function()
			require("conform").format({ lsp_fallback = true })
		end, { desc = "Format file or selection" })
	end,
}

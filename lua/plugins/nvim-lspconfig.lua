return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- always show sign column to prevent jitter
		vim.opt.signcolumn = "yes"

		-- capabilities
		local caps = vim.lsp.protocol.make_client_capabilities()
		local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
		if ok_cmp then
			caps = cmp_lsp.default_capabilities(caps)
		end

		vim.lsp.config("clangd", {
			cmd = { "clangd", "--clang-tidy=false" },
			capabilities = caps,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }
				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end,
		})

		local ok_cmp_core, cmp = pcall(require, "cmp")
		if ok_cmp_core then
			cmp.setup({
				sources = { { name = "nvim_lsp" } },
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end, 
				},
				mapping = cmp.mapping.preset.insert({}),
			})
		end
	end,
}

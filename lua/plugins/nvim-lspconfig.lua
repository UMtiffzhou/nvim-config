-- lua/plugins/nvim-lspconfig.lua
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
				vim.keymap.set(
					"n",
					"K",
					"<cmd>lua vim.lsp.buf.hover()<cr>",
					{ buffer = event.buf, desc = "Hover documentation" }
				)
				vim.keymap.set(
					"n",
					"gd",
					"<cmd>lua vim.lsp.buf.definition()<cr>",
					{ buffer = event.buf, desc = "Go to definition" }
				)
				vim.keymap.set(
					"n",
					"gD",
					"<cmd>lua vim.lsp.buf.declaration()<cr>",
					{ buffer = event.buf, desc = "Go to declaration" }
				)
				vim.keymap.set(
					"n",
					"gi",
					"<cmd>lua vim.lsp.buf.implementation()<cr>",
					{ buffer = event.buf, desc = "Go to implementation" }
				)
				vim.keymap.set(
					"n",
					"gl",
					"<cmd>lua vim.diagnostic.open_float()<cr>",
					{ buffer = event.buf, desc = "Show line diagnostics" }
				)
				vim.keymap.set(
					"n",
					"go",
					"<cmd>lua vim.lsp.buf.type_definition()<cr>",
					{ buffer = event.buf, desc = "Go to type definition" }
				)
				vim.keymap.set(
					"n",
					"gr",
					"<cmd>lua vim.lsp.buf.references()<cr>",
					{ buffer = event.buf, desc = "Show references" }
				)
				vim.keymap.set(
					"n",
					"gs",
					"<cmd>lua vim.lsp.buf.signature_help()<cr>",
					{ buffer = event.buf, desc = "Show signature" }
				)
				vim.keymap.set(
					"n",
					"<leader>rn",
					"<cmd>lua vim.lsp.buf.rename()<cr>",
					{ buffer = event.buf, desc = "Rename symbol" }
				)
				vim.keymap.set(
					"n",
					"<leader>ca",
					"<cmd>lua vim.lsp.buf.code_action()<cr>",
					{ buffer = event.buf, desc = "LSP fixes" }
				)
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

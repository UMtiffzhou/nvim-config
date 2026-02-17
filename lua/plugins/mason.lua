return {
	{ "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "pyright", "bashls", "jsonls", "yamlls", "rust_analyzer" },
		},
		config = function(_, opts)
			local mlsp = require("mason-lspconfig")

			-- Build capabilities once (e.g. for nvim-cmp)
			local caps = vim.lsp.protocol.make_client_capabilities()
			local ok, cmp = pcall(require, "cmp_nvim_lsp")
			if ok then
				caps = cmp.default_capabilities(caps)
			end
			-- If you use nvim-ufo, you can also add:
			-- caps.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

			-- Register per-server options with the native API
			for _, server in ipairs(opts.ensure_installed) do
				local o = { capabilities = caps }
				if server == "lua_ls" then
					o.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
				end
				vim.lsp.config(server, o) -- <-- new way
			end

			-- Let Mason install & (by default) enable them
			mlsp.setup(opts)

			-- If you’ve disabled mason-lspconfig’s auto-enable, do:
			-- vim.lsp.enable(opts.ensure_installed)
		end,
	},
}

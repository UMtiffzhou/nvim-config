return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = "williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"prettier",
			"eslint_d",
			"stylua",
			"shfmt",
			"clangd",
		},
		auto_update = true,
		run_on_start = true,
	},
}

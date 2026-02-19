-- lua/plugins/statuscol.lua
return {
	"luukvbaal/statuscol.nvim",
	dependencies = { "lewis6991/gitsigns.nvim" },
	event = "VeryLazy",
	opts = function()
		local builtin = require("statuscol.builtin")

		return {
			relculright = true,
			segments = {
				-- git signs
				{
					sign = { namespace = { "gitsigns" }, maxwidth = 1, colwidth = 1, auto = true },
					click = "v:lua.ScSa",
				},
				-- folds
				{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
				-- line num
				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
				-- lsp
				{
					sign = {
						name = { "Diagnostic" },
						maxwidth = 1,
						colwidth = 1,
						auto = true,
					},
					click = "v:lua.ScSa",
				},
			},
		}
	end,
	config = function(_, opts)
		require("statuscol").setup(opts)
	end,
}

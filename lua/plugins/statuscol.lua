return {
	"luukvbaal/statuscol.nvim",
	event = "VeryLazy",
	opts = function()
		local builtin = require("statuscol.builtin")
		return {
			relculright = true,
			segments = {
				{
					text = {
						" ",
						function(args)
							local is_cursor = args.relnum == 0
							local n = is_cursor and args.lnum or args.relnum
							local hl = is_cursor and "%#cur_line#" or "%#LineNr#"
							return hl .. string.format("%2d", n)
						end,
						" ",
					},
					condition = {
						true,
						function()
							return vim.bo.filetype ~= "NvimTree"
						end,
						function(args)
							return args.actual_curwin == args.win
						end,
						builtin.not_empty,
					},
					align = "right",
					click = "v:lua.ScLa",
				},
				{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
			},
		}
	end,
	config = function(_, opts)
		require("statuscol").setup(opts)
		local hl = vim.api.nvim_get_hl(0, { name = "Normal", link = false })["fg"]
		vim.api.nvim_set_hl(0, "cur_line", { fg = hl, bold = true })
	end,
}

return {
	"kevinhwang91/nvim-ufo",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "kevinhwang91/promise-async" },

	init = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
	end,

	keys = {
		{
			"zR",
			function()
				require("ufo").openAllFolds()
			end,
			desc = "UFO open all",
		},
		{
			"zM",
			function()
				require("ufo").closeAllFolds()
			end,
			desc = "UFO close all",
		},
	},

	opts = function()
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText, suffix = {}, (" 󰁂 %d "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth, curWidth = width - sufWidth, 0
			for _, chunk in ipairs(virtText) do
				local text, hl = chunk[1], chunk[2]
				local w = vim.fn.strdisplaywidth(text)
				if targetWidth > curWidth + w then
					table.insert(newVirtText, chunk)
				else
					text = truncate(text, targetWidth - curWidth)
					table.insert(newVirtText, { text, hl })
					w = vim.fn.strdisplaywidth(text)
					if curWidth + w < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - w)
					end
					break
				end
				curWidth = curWidth + w
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end

		return {
			fold_virt_text_handler = handler,
			provider_selector = function()
				return { "lsp", "indent" }
			end,
		}
	end,

	config = function(_, opts)
		require("ufo").setup(opts)
	end,
}

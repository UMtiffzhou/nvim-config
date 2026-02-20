-- lua/plugins/gitsigns.lua
return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, silent = true, desc = desc })
			end

			-- navigation
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gs.nav_hunk("next")
				end
			end, "Next Git Hunk")

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gs.nav_hunk("prev")
				end
			end, "Previous Git Hunk")

			-- hunk preview
			map("n", "<leader>gg", gs.preview_hunk, "Preview Git Hunk")

			-- staging and unstaging (normal mode - whole hunk under cursor)
			map("n", "<leader>gs", gs.stage_hunk, "(Un)Stage Git Hunk")
			map("n", "<leader>grr", gs.reset_hunk, "Reset Git Hunk")

			-- partial staging (visual mode - only highlighted lines)
			map("v", "<leader>gs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "(Un)Stage Git Selection")
			map("v", "<leader>gr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset Git Selection")
		end,
	},
}

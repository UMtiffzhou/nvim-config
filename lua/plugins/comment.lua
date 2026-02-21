-- lua/plugins/comment.lua
return {
	"numToStr/Comment.nvim",
	keys = {
		-- --- Line Comments (Ctrl + /) ---
		{
			"<C-_>",
			"<Plug>(comment_toggle_linewise_current)",
			mode = "n",
			desc = "Comment toggle line",
		},
		{
			"<C-_>",
			"<Plug>(comment_toggle_linewise_visual)",
			mode = "v",
			desc = "Comment toggle selection",
		},
		{
			"<C-_>",
			"<C-o><Plug>(comment_toggle_linewise_current)",
			mode = "i",
			desc = "Comment toggle line",
		},

		-- --- Block Comments (Alt + /) ---
		{
			"<M-/>",
			"<Plug>(comment_toggle_blockwise_current)",
			mode = "n",
			desc = "Comment toggle block line",
		},
		{
			"<M-/>",
			"<Plug>(comment_toggle_blockwise_visual)",
			mode = "v",
			desc = "Comment toggle block selection",
		},
		{
			"<M-/>",
			"<Esc><Plug>(comment_toggle_blockwise_current)A",
			mode = "i",
			desc = "Comment toggle block line",
		},
	},
	opts = {},
}

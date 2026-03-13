return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			-- your configuration comes here
			keymaps = {
				-- your keymaps
				accept_suggestion = "<C-n>",
			},
		})
	end,
}

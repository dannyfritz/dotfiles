return {
	n = {
		["<leader><le,ader>"] = { "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
		["<leader>bn"] = {
			function()
				require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
			end,
			desc = "Next buffer",
		},
		["<leader>bp"] = {
			function()
				require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
			end,
			desc = "Previous buffer",
		},
	},
}

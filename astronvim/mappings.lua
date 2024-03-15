return {
	n = {
		["<leader><leader>"] = { "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		["<leader>,"] = { "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
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
		["<leader>by"] = {
			function()
				vim.cmd([[let @+ = expand('%:p')]]);
			end,
			desc = "Yank Buffer Filename to Clipboard",
		},
	},
}

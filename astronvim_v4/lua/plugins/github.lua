return {
	{
		"almo7aya/openingh.nvim",
		keys = {
			{ "<leader>gop", mode = { "n" }, ":OpenInGHRepo<cr>", desc = "Open Project" },
			{ "<leader>gof", mode = { "n", "v" }, ":OpenInGHFile<cr>", desc = "Open File" },
			{ "<leader>gob", mode = { "n", "v" }, ":OpenInGHFile!<cr>", desc = "Open File in Base Branch" },
		},
	},
}


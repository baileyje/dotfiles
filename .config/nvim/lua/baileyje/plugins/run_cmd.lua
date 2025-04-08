return {
	"ideless/run_command.nvim",
	dependencies = {
		"akinsho/toggleterm.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {},
	keys = {
		{ "<leader>rr", ":RcRun", desc = "Run Command" },
		{ "<leader>rl", ":RcRunLast<CR>", desc = "Run Last Command" },
		{ "<leader>rh", ":RcRunFromHistory<CR>", desc = "Run Command from History" },
		{ "<leader>rc", ":RcClearHistory<CR>", desc = "Clear run History" },
	},
	window = {
		direction = "vertical", -- Options: "vertical", "vertical", "tab"
		name = "cmd_term",
	},
}

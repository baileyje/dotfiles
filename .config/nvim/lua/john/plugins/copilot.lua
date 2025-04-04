-- return {
-- 	-- other plugins
--
-- 	{
-- 		"zbirenbaum/copilot-cmp",
-- 		event = "InsertEnter",
-- 		config = function()
-- 			require("copilot_cmp").setup()
-- 		end,
-- 		dependencies = {
-- 			"zbirenbaum/copilot.lua",
-- 			cmd = "Copilot",
-- 			config = function()
-- 				require("copilot").setup({
-- 					suggestion = { enabled = false },
-- 					panel = { enabled = false },
-- 				})
-- 			end,
-- 		},
-- 	},
-- }
--

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		suggestion = { enabled = false },
		panel = { enabled = false },
		filetypes = {
			markdown = true,
			help = true,
		},
	},
}

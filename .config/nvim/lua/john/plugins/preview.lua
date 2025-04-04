return {
	"https://gitlab.com/itaranto/preview.nvim",
	version = "*",
	dependencies = { "javiorfo/nvim-nyctophilia" },
	opts = {
		-- Your options.
		previewers_by_ft = {
			plantuml = {
				name = "plantuml_text",
				renderer = { type = "buffer", opts = { split_cmd = "vsplit" } },
			},
			markdown = {
				name = "glow",

				renderer = { type = "buffer", opts = { split_cmd = "vsplit" } },
			},
		},
		previewers = {
			glow = {
				command = "glow",
				args = { "-n" },
				stdin = true,
				stdout = true,
			},
		},
		render_on_write = false,
	},
}

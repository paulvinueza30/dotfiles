return {
	"folke/snacks.nvim",
	opts = {
		scroll = {
			enabled = false,
		},
		explorer = {
			enabled = true,
			hidden = true,
			include = { ".*" },
		},
		picker = {
			sources = {
				explorer = {
					hidden = true,
					include = { ".*" },
					auto_close = true,
					layout = {
						preview = true,
						layout = {
							box = "horizontal",
							width = 0.8,
							height = 0.8,
							{
								box = "vertical",
								border = "rounded",
								title = "{source} {live} {flags}",
								title_pos = "center",
								{ win = "input", height = 1, border = "bottom" },
								{ win = "list", border = "none" },
							},
							{ win = "preview", border = "rounded", width = 0.7, title = "{preview}" },
						},
					},
				},
			},
		},
	},
}

return {
	{ 
		--color plugins
		"norcalli/nvim-colorizer.lua",
		opts = {
			"*",
			css = { 
				rgb_fn = true,
				RRGGBB = true,
			},
			html = {
				names = false,
			},
		},
	},
}

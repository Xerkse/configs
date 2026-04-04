return {
	{
		'mrcjkb/rustaceanvim',
		version = '^6', -- Recommended
		lazy = false, -- This plugin is already lazy
		["rust_analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},

		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
}

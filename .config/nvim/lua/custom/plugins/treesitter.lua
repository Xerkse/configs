return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		branch = "main", --explicit main branch where the new treesitter is for nvim 0.12
		build = ":TSUpdate",
		init = function()

			vim.api.nvim_create_autocmd('FileType', { 
				callback = function() 
					-- Enable treesitter highlighting and disable regex syntax
					pcall(vim.treesitter.start) 
					-- Enable treesitter-based indentation
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" 
				end, 
			}) 

			local ensureInstalled = {
				'c',
				'cpp',
				'c_sharp',
				'go',
				'lua',
				'python',
				'rust',
				'tsx',
				'typescript',
				'r',
				'vim',
				'bash',
				'regex',
				'latex',
				'markdown',
				'markdown_inline',
			}
			local alreadyInstalled = require('nvim-treesitter.config').get_installed()
			local parsersToInstall = vim.iter(ensureInstalled)
				:filter(function(parser)
					return not vim.tbl_contains(alreadyInstalled, parser)
				end)
				:totable()
			require('nvim-treesitter').install(parsersToInstall)

			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

			---@diagnostic disable-next-line: missing-fields
			-- require("nvim-treesitter.configs").setup({

			-- require("nvim-treesitter").setup({
			-- 	ensure_installed = {
			-- 	},
			-- 	-- Autoinstall languages that are not installed
			-- 	auto_install = true,
			-- 	highlight = { enable = true },
			-- 	indent = { enable = true },
			-- })

			-- There are additional nvim-treesitter modules that you can use to interact
			-- with nvim-treesitter. You should go explore a few and see what interests you:
			--
			--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},
}

-- NOTE: old stuff
--
-- 		config = function()
-- 			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--
-- 			---@diagnostic disable-next-line: missing-fields
-- 			-- require("nvim-treesitter.configs").setup({
-- 			require("nvim-treesitter").setup({
-- 				ensure_installed = {
-- 					"c",
-- 					"cpp",
-- 					"c_sharp",
-- 					"go",
-- 					"lua",
-- 					"python",
-- 					"rust",
-- 					"tsx",
-- 					"typescript",
-- 					"r",
-- 					"vim",
-- 					"bash",
-- 					"regex",
-- 					"latex",
-- 				},
-- 				-- Autoinstall languages that are not installed
-- 				auto_install = true,
-- 				highlight = { enable = true },
-- 				indent = { enable = true },
-- 			})
--
-- 			-- There are additional nvim-treesitter modules that you can use to interact
-- 			-- with nvim-treesitter. You should go explore a few and see what interests you:
-- 			--
-- 			--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
-- 			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
-- 			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- 		end,
-- 	},
-- }

-- NOTE: the below is old code which I had from previous files
--
-- 	{ -- Highlight, edit, and navigate code
-- 		"nvim-treesitter/nvim-treesitter",
-- 		dependencies = {
-- 			"nvim-treesitter/nvim-treesitter-textobjects",
-- 		},
-- 		config = function()
-- 			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
-- 		end,
-- 	},
-- 	{ -- Highlight, edit, and navigate code
-- 		"nvim-treesitter/nvim-treesitter",
-- 		build = ":TSUpdate",
-- 		config = function()
-- 			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--
-- 			---@diagnostic disable-next-line: missing-fields
-- 			require("nvim-treesitter").setup({
-- 				ensure_installed = {
-- 					"c",
-- 					"cpp",
-- 					"go",
-- 					"lua",
-- 					"python",
-- 					"rust",
-- 					"tsx",
-- 					"typescript",
-- 					"r",
-- 					"vim",
-- 					"bash",
-- 					"regex",
-- 					"latex",
-- 				},
-- 				-- Autoinstall languages that are not installed
-- 				auto_install = true,
-- 				highlight = { enable = true },
-- 				indent = { enable = true },
-- 			})
--
-- 			-- There are additional nvim-treesitter modules that you can use to interact
-- 			-- with nvim-treesitter. You should go explore a few and see what interests you:
-- 			--
-- 			--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
-- 			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
-- 			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- 		end,
-- 	},
-- }

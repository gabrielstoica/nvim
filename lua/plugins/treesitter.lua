return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			-- Allow treesitter to install a parser for every language it encounts
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
